# Cargamos las librerías a utilizar
library(data.table)
library(ChemmineR)
library(ggplot2)
library(plotly)
library(gridExtra)
library(fmcsR)


# Seteamos directorio de trabajo y cargamos dataset
setwd("/mi/directorio/de/trabajo")
sdfset <- read.SDFset("all-V1inhibs.sdf")

# Removemos compuestos no válidos y duplicados, si los hubiera
valid <- validSDF(sdfset)
sdfset <- sdfset[valid]
apset <- sdf2ap(sdfset)
duplicates <- as.data.table(cmp.duplicated(apset, type=2))[CLSZ_100 > 1]
apdups <- cmp.duplicated(apset, type=1)
nodup.sdfset <- sdfset[which(!apdups)]
nodup.apset<- apset[which(!apdups)]

# Caracterización fisicoquímica
nodup.sdfset.data <- as.data.table(propOB(nodup.sdfset))

# Plotear 
plotLibrary <- function(OBData){
  plotear <- list("MW","MR","TPSA","logP")
  plots <- list()
  for(feature in plotear){
    p <- ggplot(OBData[,feature, with=F], aes_string(feature))+
      geom_histogram(aes(y = ..density..), binwidth=density(as.list(OBData[,feature, with=F])[[feature]])$bw) +
      geom_density(fill="red", alpha = 0.2)
    #p <- ggplotly(p)
    plots[[feature]] <- p
  }
  do.call("grid.arrange", c(plots, ncol=2))
}

plotLibrary(nodup.sdfset.data)

# filtramos todo lo que no queremos según reglas de medchem

# Lipinsky
# MW < 500 Da
# logP < 5
# HBD < 5
# HBA < 10
lip <- nodup.sdfset.data[MW<500 & logP <5 & (HBA1 + HBA2) < 10 & HBD <5]

# Ghose Filter
# -0.4 < logP < 5.6
# 40 < MR < 130
# 180 < MW < 480
# TPSA < 140
# 20 < Natoms < 70 *
# Rotable bonds < 10 *
gho <- nodup.sdfset.data[(logP < 5.6 & logP > -0.4) & (MR>40 & MR<130) & (MW>180 & MW<480) & (TPSA < 140)]

druglike.sdfset.data <- unique(rbind(lip,gho))

# Y lo exportamos para usar luego
write.table(set.filtrado.data[,cansmi], file="druglike.list",row.names=F,col.names=F,quote=F,sep="\t")
convertFormatFile("SMI","SDF","druglike.list","drugllibrary(data.table)ike.sdf")

# Importamos el nuevo set
druglike.sdfset <- read.SDFset("druglike.sdf")
druglike.apset <- sdf2ap(druglike.sdfset)

druglike.sdfset.data <- as.data.table(propOB(druglike.sdfset))
plotLibrary(druglike.sdfset.data)

# Redundancia menos astringente (por clusters de similitud)
clusters <- as.data.table(cmp.cluster(db=druglike.apset, cutoff = c(0.7, 0.8, 0.9), quiet = TRUE))
clusters.08_sim.dups <- clusters[CLSZ_0.8 > 1][,CLID_0.8]

# Reviso con qué compuestos me voy a quedar (keep=1)
clusters[CLSZ_0.8 == 1, keep:=1]
for(clust in clusters.08_sim.dups){
  new=1
  for(comp in clusters[CLID_0.8==clust][,ids]){
    if(new==1){
      clusters[ids==comp, keep:=1]
      new=0
    } else {
      clusters[ids==comp, keep:=0]
    }
  }
}

# Y luego filtro los que no quiero (keep=0)
clusters.dups <- clusters[,keep==0]

# Y ahora los saco del sdfset y el apset, para ver las características de la librería virtual
singlet.druglike.sdfset <- druglike.sdfset[which(!clusters.dups)]
singlet.druglike.sdfset.data <- as.data.table(propOB(singlet.druglike.sdfset))
plotLibrary(singlet.druglike.sdfset.data)


# Como último filtro, vamos a aplicar criterios de MCS para minimizar la redundancia de grupos funcionales
# y así diversificar nuestra librería

# Matrix de distancias MCS <- Esto tarda MUCHO así que lo vamos a cargar directamente 
# d <- sapply(cid(singlet.druglike.sdfset), function(x) fmcsBatch(singlet.druglike.sdfset[x], singlet.druglike.sdfset, au=0, bu=0, matching.mode="aromatic")[,"Overlap_Coefficient"]) 
# write.table(d, file="mcs.distmatrix.tsv",row.names=T,col.names=T,quote=F,sep="\t")

library(factoextra)
library(cluster)

ddf <- as.data.frame(read.csv(file="mcs.distmatrix.tsv",sep="\t"))

# Estimación de número de clusters
k.plot <- fviz_nbclust(ddf, kmeans, method = "silhouette", k.max=100)
which.max(k.plot$data$y)

# Generación de clusters 
k.clusters.70 <- kmeans(ddf,70)$cluster
k.clusters.70.dt <- data.table(CMP=names(k.clusters.70),ClustID=k.clusters.70)

k.clusters.50 <- kmeans(ddf,50)$cluster
k.clusters.50.dt <- data.table(CMP=names(k.clusters.50),ClustID=k.clusters.50)

k.clusters.20 <- kmeans(ddf,20)$cluster
k.clusters.20.dt <- data.table(CMP=names(k.clusters.20),ClustID=k.clusters.20)

# Qué pasó con CMP12 y CMP16
k.clusters.20.dt[CMP=="CMP16" | CMP=="CMP12"]
k.clusters.50.dt[CMP=="CMP16" | CMP=="CMP12"]
k.clusters.70.dt[CMP=="CMP16" | CMP=="CMP12"]

# Veamos el tamaño de los clusters
k.clusters.20.size <- unique(k.clusters.20.dt[,N:=.N,by="ClustID"][order(-N)][,.(ClustID,N)])
k.clusters.50.size <- unique(k.clusters.50.dt[,N:=.N,by="ClustID"][order(-N)][,.(ClustID,N)])
k.clusters.70.size <- unique(k.clusters.70.dt[,N:=.N,by="ClustID"][order(-N)][,.(ClustID,N)])

p20 <- ggplot(k.clusters.20.size,aes(x=reorder(ClustID,-N),y=N))+geom_bar(stat="Identity")
p50 <- ggplot(k.clusters.50.size,aes(x=reorder(ClustID,-N),y=N))+geom_bar(stat="Identity")
p70 <- ggplot(k.clusters.70.size,aes(x=reorder(ClustID,-N),y=N))+geom_bar(stat="Identity")
grid.arrange(p20,p50,p70,nrow=3)


# Dado que vamos a agarrar uno al azar, setamos una semilla para que el resultado sea reproducible
set.seed(1)
libreria <- k.clusters.50.dt[,sample(CMP,1),by = ClustID][order(ClustID)]
singlet.druglike.sdfset.final <- singlet.druglike.sdfset[libreria[,V1]]
SDFDataTable(singlet.druglike.sdfset.final)

clust <- k.clusters.50.dt[CMP=="CMP439"][,ClustID]
libreria.min <- unique(k.clusters.50.dt[ClustID==clust][,CMP])
singlet.druglike.sdfset.final.min <- singlet.druglike.sdfset[libreria.min]
SDFDataTable(singlet.druglike.sdfset.final.min)

activos.dt <- as.data.table(read.csv(file="activos.tsv",sep="\t"))
activos <- singlet.druglike.sdfset[actividad.dt[,CMP]]
activos.data <- as.data.table(propOB(activos))
SDFDataTable(singlet.druglike.sdfset.final.min)




