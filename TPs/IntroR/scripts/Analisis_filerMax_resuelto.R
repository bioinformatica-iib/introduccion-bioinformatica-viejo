library(nplr)
library(ggplot2)
setwd("/home/ibioinfo/TP_introR/")
dt <- read.table("./data/datos_filtermax.txt",sep="\t",fill = T,stringsAsFactors = F)
dt <- dt[c(2:6),]
colnames(dt) <- dt[1,]
dt <- dt[-1,]

nueva_dt <- data.frame(filaW="",columnaW=0,signal=0,Time="",stringsAsFactors = F)
for (i in 3:length(dt[1,])){
  # i <- 5
  nombre_pocillo <- colnames(dt)[i]
  nombre_split <- strsplit(nombre_pocillo,split="")[[1]]
  fila_pocillo <- nombre_split[1]
  numero_pocillo <- paste(nombre_split[-1],collapse = "",sep="")
  dt_pocillo <- dt[,c("Time",nombre_pocillo)]
  dt_pocillo$signal <- dt_pocillo[,2]
  dt_pocillo[,nombre_pocillo] <- NULL
  dt_pocillo$filaW <- fila_pocillo
  dt_pocillo$columnaW <- numero_pocillo
  nueva_dt <- rbind(nueva_dt,dt_pocillo)
}
nueva_dt <- nueva_dt[-1,]

dt_compuestos <- read.csv("./data/diseño_compuestos",sep="\t",stringsAsFactors = F)
dt_diluciones <- read.csv("./data/diseño_diluciones",sep="\t",stringsAsFactors = F,dec = ",")
nueva_dt_completa <- merge(nueva_dt,dt_diluciones,by.x="filaW",by.y="Fila")
nueva_dt_completa <- merge(nueva_dt_completa,dt_compuestos,by.x="columnaW",by.y="Columna")

head(nueva_dt_completa)
summary(nueva_dt_completa)

nueva_dt_completa$signal <- as.numeric(nueva_dt_completa$signal)
nueva_dt_completa[nueva_dt_completa$Inhibidor.uM==0,]$Compuesto <- "DMSO"

times_temp <- strsplit(nueva_dt_completa$Time,split=":")
nueva_dt_completa$Time <- as.numeric(unlist(lapply(times_temp, `[[`, 1)))*60+as.numeric(unlist(lapply(times_temp, `[[`, 2)))+as.numeric(unlist(lapply(times_temp, `[[`, 3)))/60

head(nueva_dt_completa)
summary(nueva_dt_completa)

pdf("./results/TPintroRFilterMax.pdf")
lista_compuestos <- unique(nueva_dt_completa$Compuesto)
for(i in 1:length(lista_compuestos)){
  # i<-1
  plot_1 <- ggplot(data=nueva_dt_completa[nueva_dt_completa$Compuesto=="DMSO",],aes(x=Time,y=signal,color=Compuesto))+
    geom_point()+
    geom_smooth(method="lm")+
    theme_minimal()
  compuesto <- lista_compuestos[i]
  dt_compuesto <- nueva_dt_completa[nueva_dt_completa$Compuesto==compuesto,]
  concentraciones <- unique(dt_compuesto$Inhibidor.uM)
  for(concentracion in concentraciones){
    dt_plot <- dt_compuesto[dt_compuesto$Inhibidor.uM==concentracion,]
    plot_1 <- plot_1+ geom_point(data=dt_plot)+geom_smooth(data=dt_plot,method="lm")
  }
  print(plot_1)
}
dev.off()

dt_actividad <- data.frame(compuesto="",concentracion=0,vel.reaccion=0,stringsAsFactors = F)
for(i in 1:length(lista_compuestos)){
  # i<-1
  compuesto <- lista_compuestos[i]
  dt_compuesto <- nueva_dt_completa[nueva_dt_completa$Compuesto==compuesto,]
  concentraciones <- unique(dt_compuesto$Inhibidor.uM)
  for(concentracion in concentraciones){
    dt_regresion <- dt_compuesto[dt_compuesto$Inhibidor.uM==concentracion,]
    lm_temp <- lm(data = dt_regresion,formula = signal~Time)
    dt_actividad_temp <- dt_actividad[1,]
    dt_actividad_temp$compuesto[1] <- compuesto
    dt_actividad_temp$concentracion[1] <- concentracion
    dt_actividad_temp$vel.reaccion[1] <- lm_temp$coefficients[2]
    dt_actividad <- rbind(dt_actividad,dt_actividad_temp)
  }
}
dt_actividad <- dt_actividad[-1,]
head(dt_actividad)
vel.sin.inhibicion <- dt_actividad[dt_actividad$compuesto=="DMSO",]$vel.reaccion
dt_actividad$actividad <- 100*(dt_actividad$vel.reaccion/vel.sin.inhibicion)
head(dt_actividad)

dt_resultado <- data.frame(compuesto=lista_compuestos,IC50=0,min=0,max=0)
pdf("./results/Curvas_dosisRespuesta.pdf")
for(i in 1:length(lista_compuestos)){
  # i<-13
  compuesto <- lista_compuestos[i]
  if(compuesto=="DMSO"){
    next()
  }
  dt_plot <- dt_actividad[dt_actividad$compuesto==compuesto,]
  sigm_temp <- nplr(x = dt_plot$concentracion,y=dt_plot$actividad/100)
  temp_IC50 <- round(getEstimates(sigm_temp, .5, conf.level=.99),2)
  titulo <- paste0(compuesto,"\n IC50 : ",temp_IC50$x , " uM [", temp_IC50$x.005, "," ,temp_IC50$x.995,"]") 
  print(plot(sigm_temp,main=titulo,xlab="Log10 concentration",ylab= "Activity"))
  dt_resultado[dt_resultado$compuesto==compuesto,]$IC50 <- temp_IC50$x
  dt_resultado[dt_resultado$compuesto==compuesto,]$min <- temp_IC50$x.005
  dt_resultado[dt_resultado$compuesto==compuesto,]$max <- temp_IC50$x.995
}
dev.off()
dt_resultado <- dt_resultado[order(dt_resultado$IC50,decreasing = F),]
head(dt_resultado)
write.table(dt_resultado,file = "./results/tablaIC50.tsv",sep="\t",row.names = F,quote = F)
