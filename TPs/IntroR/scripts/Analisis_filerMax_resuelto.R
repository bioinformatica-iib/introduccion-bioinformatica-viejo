dt <- read.table("/home/leonel/Dropbox (trypanosomatics)/Personal/docencia/introduccion-bioinformatica/TPs/IntroR/data/datos_filtermax.txt",sep="\t",fill = T,stringsAsFactors = F)
dt <- dt[c(2:15),]
colnames(dt) <- dt[1,]
dt <- dt[-1,]

nueva_dt <- data.frame(filaW="",columnaW=0,signal=0,Time="",stringsAsFactors = F)
for (i in 3:length(dt[1,])){
  # i <- 3
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
nueva_dt <- nueva_dt[nueva_dt$columnaW<19,]

dt_compuestos <- read.csv("/home/leonel/Dropbox (trypanosomatics)/Personal/docencia/introduccion-bioinformatica/TPs/IntroR/data/diseño_compuestos",sep="\t",stringsAsFactors = F)
dt_diluciones <- read.csv("/home/leonel/Dropbox (trypanosomatics)/Personal/docencia/introduccion-bioinformatica/TPs/IntroR/data/diseño_diluciones",sep="\t",stringsAsFactors = F)
nueva_dt_completa <- merge(nueva_dt,dt_diluciones,by.x="filaW",by.y="Fila")
