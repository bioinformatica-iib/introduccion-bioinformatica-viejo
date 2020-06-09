setwd("/home/leonel/Dropbox (trypanosomatics)/Personal/docencia/introduccion-bioinformatica/TPs/DataMining/scripts/") #Cambiar por el source correcto
MiTabla <- read.csv("../data/diauxic.txt", sep="\t", row.names=1)
MisDistancias <- dist(MiTabla,method="euclidean")
MiClusteringJerarquico <- hclust(MisDistancias, method="complete")
plot(MiClusteringJerarquico)
heatmap(as.matrix(MiTabla))
##################################################
TablaSTD <- t(scale(t(MiTabla)))
MisDistanciasSTD <- dist(TablaSTD,method="euclidean")
MiClusteringJerarquicoSTD <- hclust(MisDistanciasSTD, method="complete")
plot(MiClusteringJerarquicoSTD)
heatmap(TablaSTD, Colv=NA)
##################################################
MiClusteringKMedias <- kmeans(TablaSTD,2) 
MiClusteringKMedias 
MiCorte <- cutree(MiClusteringJerarquicoSTD,h=1.5)
MiCorte <- cutree(MiClusteringJerarquicoSTD,k=2)
################
MiClusteringKMedias <- kmeans(TablaSTD,2)
Cluster1 <- TablaSTD[which(MiCorte==1),] 
Cluster2 <- TablaSTD[which(MiCorte==2),] 
write(row.names(Cluster1), "Cluster1.ids")
write(row.names(Cluster2), "Cluster2.ids")
