#TP Data mining - Introducción al clustering en bioinformática
Técnicas para analizar grandes conjuntos de datos y encontrar patrones o comportamientos similares entre ellos 



la utilidad de las técnicas de Clustering (y Data Mining en general) para analizar e interpretar grandes conjuntos de datos, como es el caso de los generados por análisis transcriptómicos.
Comprender el "funcionamiento" de una de las técnicas mas simples de clustering no supervisado: la clasificación jerárquica ascendente (clustering jerárquico). Para esto utilizaremos un conjunto de datos mínimo para agrupar (clusterizar) a mano (o utilizando una planilla de cálculo) los datos utilizando diferentes métricas de distancia y criterios de agregación para finalmente confeccionar un dendograma.
Vamos a utilizar además otro método muy simple de clustering, en este caso particional, el K-means. Veremos algunas medidas de calidad de los clusters, como la suma de cuadrados intra-cluster y la silueta (Silhouette).
Aplicar los conocimientos adquiridos para analizar e interpretar un conjunto de datos real de expresión génica con microarrays. 

Material de lectura recomendado:

## Introducción

En este TP vamos a utilizar técnicas básicas para encontrar conglomerados o "clusters" en un conjunto de datos biológicos. La idea es identificar agrupamientos naturales en los datos, que presenten un comportamiento similar entre si, con alguna relevancia biológica. En particular utilizaremos conjuntos de datos provenientes de medidas de expresión génica generadas mediante experimentos con microarrays con muestras tomadas a diferentes tiempos, para identificar grupos o clusters de genes que tengan un perfil de expresión común.

1. En 1997 DeRisi et. al. estudiaron los cambios transcripcionales de prácticamente todos los genes de Saccharomyces cerevisiae a lo largo del salto metabólico de fermentación a respiración. En el archivo diauxic.txt se encuentra una tabla donde cada fila representa un gen y cada columna el tiempo al cual se tomó la muestra. Así, cada celda contiene una medida de la expresión de un gen particular a un momento determinado.

NAMES   col1    col2    col3    col4    col5    col6    col7
YGR138C -1.23   -0.81   1.79    0.78    -0.42   -0.69   0.58
YPR156C -1.76   -0.94   1.16    0.36    0.41    -0.35   1.12
YOR230W -2.19   0.13    0.65    -0.51   0.52    1.04    0.36
...

¿Qué genes presentan un perfil de expresión similar? ¿Cuales son los genes que se sobreexpresan al final (en ausencia de glucosa) y cuales son reprimidos? ¿Cuantos tipos de comportamientos diferentes hay? bueno ... con suerte esto lo podremos contestar hacia el final del TP ...

2. En el archivo TablaEjemplo.txt hay una tabla mínima con datos inventados. La tabla contiene para cuatro genes (A, B, C y D) su nivel de expresión a las 0hs, 1hs y 2 hs luego de algún tratamiento.

gen	0	1	2
genA	2	4	8
genB	-1	-1	-2
genC	-2	0	1
genD	0	-1	-6

Grupo Norte: graficar en Excel los niveles de expresión de cada gen por separado vs. tiempo; realizar a mano o en Excel un clustering jerárquico utilizando la distancia Euclidea, y el criterio de agregación de "Vecino mas lejano" (o "complete linkage"); grupo Sur, lo mismo pero estandarizando previamente los datos por gen (a cada dato restarle la media de expresion del gen y dividirlo por su desviación estándar). Comparar gráficos y dendogramas y discutir qué resultado (Norte o Sur) tiene más sentido biológico.

3. R es un lenguaje y un entorno orientado al análisis estadístico de datos y la generación de gráficos. En R se puede hacer prácticamente de todo y está disponible en forma gratuita tanto para sistemas operativos Linux/Unix?, MacOS y Windows. Es un paquete de software de código abierto (open source) y por lo tanto se beneficia del aporte de miles de expertos en todo el mundo. Se lo puede descargar de http://www.r-project.org. Si tienen R instalado en forma local, abrirlo y salteae este paso:

En omega.iib.unsam.edu.ar ya está instalado, y podemos utilizar el entorno de R en una terminal simplemenhte tipeando R (era obvio, no?). Sin embargo, si nos estamos conectando a omega usando una terminal remota, para poder ver los gráficos que vamos a generar tenemos que "exportar" la salida gráfica (X11) de omega. Para esto, al establecer la conexion SSH con omega hay que recordar utilizar el switch -Y.

Desde unix: ssh -Y omega.iib.unsam.edu.ar

En Windows utilizando PuTTY-Xming: Asegurarse de tener abierto el X-server (Xming), abrir PuTTY y en el panel izquierdo expandir el nodo SSH, abrir "X11" y en esa ventana, marcar la opcion "Enable X11 forwarding". Luego conectarse en forma normal.

Para comenzar a trabajar con R veremos algunos conceptos básicos intro_R_UNSAM.pdf.

Vamos a crear una carpeta donde R va a guardar todos los datos y resultados del proyecto:

# crear el directorio
mkdir MiProyectoEnR
# entrar en el directorio
cd MiProyectoEnR
# ejecutar R
R

Si aparece el prompt ">" ya estamos donde queremos. En los ejemplos que siguen > es el prompt de R.

Mi primera sesión en R

z <- 10 # se define la variable ''z'' y se le asigna el valor 10
z = 10 #idem
z # se muestra el contenido
z <- c(10,45,33)  # creamos un vector y lo asignamos a la variable ''z'' 
z[2] # usamos [] para acceder a un elemento del vector
length(z) # muestra la longitud del vector. () se usa para llamar funciones.

x <- rnorm(100,mean=10,sd=2)  # genero aleatoriamente 100 números con una distribución normal de media 10 y desvío estandar 2.
x 
mean(x) # su media
range(x) # valores mínimo y máximo
sd(x) # el desvío estandar
?hist # ayuda sobre la función hist
hist(x, main=”Mi primer histograma”) # crea histograma y lo muestra en pantalla
q() # chau!

Interactuando con R

    Ejecutar R, escribir comandos y obtener resultados en forma interactiva
    O escribir varios comandos en un archivo de texto, y ejecutarlo en R asi: source(“ruta/MiArchivo.R”)
    Usar flechas arriba y abajo para moverse en el historial de comandos
    El historial se puede guardar en cada sesión (?history)
    Pueden ejecutarse múltiples comandos en una línea, separándolos con “;”. Ej.: x<-5; y<-15;
    Con TAB, se completan nombres de objetos de R y archivos 

Volviendo al TP...

Lo primero que vamos a hacer en R es cargar los datos de la tabla de ejemplo TablaEjemplo.txt. Para esto tipear:

>MiTabla=read.csv("/curso/clustering/TablaEjemplo.txt", sep="\t", row.names="gen")

estando en omega o sino descargar el archivo TablaEjemplo.txt y reemplazar /curso/clustering/TablaEjemplo.txt por el path que corresponda. Lo que hicimos acá, fue leer el archivo de texto TablaEjemplo.txt utilizando la función read.csv() de R (csv -- comma separated values -- es la extensión que suele usarse para nombrar archivos de texto conteniendo valores separados por algún delimitador, que comunmente es una coma, o un caracter de tabulación). Además del nombre del archivo, la función read.csv nos permite declarar cual es el separador de campos (en este caso son tabulaciones, que se indican como \t), y cual es la columna que contiene los identificadores para las filas ("gen" es el nombre de esta columna en nuestro ejemplo). Finalmente, notar que el resultado de ejecutar la función read.csv se está almacenando en la variable MiTabla.

Ahora si tipeamos el nombre de esta variable, seguido de Enter, R nos muestra el contenido de la variable (nuestra tabla).

>MiTabla # seguido de Enter, nos muestra la tabla cargada.

A continuación vamos a utilizar la función dist para calcular una matriz de distancias a partir de los datos de la tabla. Recordar que estos datos ya están cargados en una variable que se llama MiTabla. Como convención a lo largo de esta guía, cualquier cosa que empiece con Mi o Mis es un nombre de variable. Podríamos haber usado cualquier nombre (por ejemplo, pepe), y ustedes pueden cambiarlos cuando usen R por su cuenta.

>MisDistancias=dist(MiTabla,method="euclidean")

La funcion dist() calcula la matriz de distancias usando la medida (el método) especificada/o, entre todas las filas de la matriz. En este ejemplo, calcula la distancia euclídea entre todos los genes tomados de a dos. El resultado se almacena en la variable llamada MisDistancias.

Para ver el resultado, simplemente pedimos el contenido de la variable:

>MisDistancias # nos muestra la matriz de distancias

Seguidamente vamos a agrupar en forma jerárquica a los genes, de acuerdo a esta matriz de distancias, utilizando la función hclust() (hierarchical clustering).

>MiClusteringJerarquico=hclust(MisDistancias, method="complete")

La función hclust() realiza el clustering jerárquico utilizando el criterio de agregación especificado ("complete linkage" o "vecino mas lejano" en este caso). En R si quieren obtener ayuda sobre algún comando, por ejemplo para ver qué otras opciones existen para una función, pueden usar la función help(). Haciendo:

>help(hclust) 

podemos ver, qué otros criterios de agreación permite la función

# output recortado 
...
  method: the agglomeration method to be used. This should be (an
          unambiguous abbreviation of) one of '"ward"', '"single"',
          '"complete"', '"average"', '"mcquitty"', '"median"' or
          '"centroid"'.
...

En este caso complete = complete linkage, single = "single linkage" (o vecino mas cercano), average = promedio.

Para graficar el resultado de este agrupamiento utilizamos la función plot()

>plot(MiClusteringJerarquico) #Grafica el dendograma que resulta del clustering jerarquico

Los gráficos en R se pueden exportar a PDF y a JPEG facilmente:

>pdf("MiImagen.pdf") #alternativamente >jpeg("MiImagen.jpeg")
>plot(MiClusteringJerarquico) # el plot se escribe en el PDF (no se muestra en pantalla!)
>dev.off() # cierra el archivo, los próximos plots volverán a ser mostrados en pantalla

Ahora vamos a repetir el análisis, estandarizando los datos de expresión disponibles para cada gen, de manera de que todos valores de expresión se encuentren en la misma escala y centrados en cero, tal como lo hicimos manualmente en el ejercicio anterior. R cuenta con la función scale() para estandarizar datos. El problema es que esta función estandariza por columnas, y nosotros necesitamos hacerlo por filas (las columnas contienen datos de expresión para todos los genes). Por lo tanto necesitamos transponer la matriz de datos, de manera de que las columnas pasen a ser filas y viceversa. Para transponer tablas, R nos ofrece la función t().

MiTablaTranspuesta=t(MiTabla)

Analizar el contenido de la nueva variable MiTablaTranspuesta para ver como se modificaron los datos. A continuación, podemos utilizar scale() sobre esta nueva tabla.

MiTablaEstandarizadaTranspuesta=scale(MiTablaTranspuesta)

Analizar el contenido de la nueva variable MiTablaEstandarizadaTranspuesta para verificar que los datos hayan sido normalizados. Finalmente, necesitamos volver a transponer la tabla estandarizada, para tener nuevamente los datos por gen en filas, y los datos de los distintos tiempos en columnas.

MiTablaEstandarizada=t(MiTablaEstandarizadaTranspuesta)

Esto mismo que hemos hecho en tres pasos (transponer la tabla, normalizarla y volverla a transponer), puede hacerse en un solo paso, así:

>MiTablaSTD=t(scale(t(MiTabla)))

#comparar las medias y las dispersiones....
summary(t(MiTabla))
summary(t(MiTablaSTD))
sd(t(MiTablaSTD))
sd(t(MiTabla))

Ahora vamos a repetir todos los comandos desde >MisDistancias=dist(MiTabla,method="euclidean") inclusive, en adelante, pero utilizando la tabla con los datos estandarizados !MiTablaSTD.

OPCIONAL
Podemos probar con otras medidas de distancia entre datos de expresión, por ejemplo basadas en correlación. Las distancias basadas en correlación permiten comparar "tendencias" en los datos no estandarizados, en forma similar a la distancia euclídea con datos previamente estandarizados. Este tipo de distancias, como la correlación de Pearson, son las mas utilizadas en analisis de expresiòn génica con microarrays.

DistanciaCorr=as.dist(1-cor(t(MiTabla))) 

La funcion cor() calcula la matriz de correlaciones sobre las columnas, por defecto, utiliza la correlación de Pearson. Este coeficiente de correlacion varia entre 1 (genes perfectamente correlacionados) y -1 (correlación negativa perfecta: cuando uno sube, el otro baja), pasando por el 0 (no hay correlación lineal entre ellos). La distancia es 1-cor() de forma tal que si la correlación alta, la distancia sea mínima y viceversa. La función as.dist() convierte la matriz al formato correcto para ser utilizado por las funciones de clustering, como hclust().

Luego de visualizar el nuevo dendograma....

>heatmap(MiTablaSTD, Colv=NA)

Inspeccionamos el heatmap que es una imagen que muestra niveles de expresion mas altos como mas calientes o blancos/amarillos y los de menos expresion como mas frios o rojos. Colv indica si las columnas (tiempos en este caso) deben ser agrupadas o reordenadas y cómo. Colv= NA(not available), indica que no las reagrupe (respetando el orden natural de la variable tiempo). Las filas (genes) van a ser agrupadas utilizando la funcion hclust() con sus opciones por default y la distancia euclidea, a menos que se indique otra cosa.

Observando el dendograma de los datos estandarizados y el heatmap, podemos ver que hay dos grupos bien distinguibles de genes. Uno que aumenta su expresión a lo largo del tiempo y el otro que disminuye. Podemos cortar el arbol para quedarnos con estos dos grupos a cualquier altura entre ~1 y ~2.5, con la funcion "cutree"...

>MiCorte=cutree(MiClusteringJerarquicoSTD,h=1.5)  # cortamos el arbol a la altura de 1.5.
#o lo que es lo mismo...
>MiCorte=cutree(MiClusteringJerarquicoSTD,k=2) # cortamos el arbol a una altura tal que el número de clusters obtenido sea de 2.
>MiCorte #visualizamos a que cluster fue asignado cada gen

Ahora vamos a agrupar los genes del mismo ejemplo por el método de K-medias, al que se le debe pedir a priori un número K de clusters. En este caso, vamos a pedir K=2.

>MiClusteringKMedias=kmeans(MiTablaSTD,2) 
>MiClusteringKMedias # vemos el resultado, que como es de esperar para un caso tan simple, coincide con el método jerárquico.

Si el número de clusters a encontrar fuera mayor, es recomendable aumentar el número de inicios al azar; por ejemplo, para inicializar 100 veces en forma aleatoria:

>kmeans(MiTablaGrande,5,nstart=100)

4. Análisis de Clustering de expresión génica durante salto diáuxico en levaduras Ahora con lo aprendido, importar y analizar el conjunto de datos diauxic.txt (omega:/curso/clustering/diauxic.txt). Identificar grupos de genes que se comporten de manera similar...

4.2 Análisis de enriquecimiento funcional Despues de haber identificado clusters, analizado el comportamiento global de los datos y probado algunas herramientas de visualización, exportar los identificadores de los genes pertenecientes a los diferentes clusters encontrados (ver instrucciones abajo). En esta instancia tenemos clusters de genes (al menos 2) que presentan comportamientos diferentes y nos podríamos preguntar por ejemplo, si los genes pertenecientes a uno de los clusters, estan involucrados en procesos biológicos diferentes a los genes de otro de los clusters. Ya que el genoma de Saccharomyces cerevisiae esta anotado con mucho detalle y sus genes tienen asignados los procesos biológicos en los que participan ( mediante términos de la ontología GO ) podemos averiguar si los genes de un cluster estan enriquecidos en términos GO correspondientes a ciertos procesos biológicos, respecto a los genes de otro cluster o bien, respecto a todo el genoma. Para esto utilizar algun servidor online, como FatiGO, GOrilla o DAVID. El servidor requiere seleccionar el organismo (S. cerevisiae), subir una lista de identificadores de genes de interés (uno de los clusters, en el que queremos detectar enriquecimiento funcional), e indicar contra qué los queremos contrastar (genoma u otra lista de interés, e.g. otro cluster). Dependiendo de la herramienta utilizada, también hay que seleccionar una o más bases de datos de anotación funcional (en este caso, GO - biological process; pero bien podríamos seleccionar otra, como Interpro motifs y detectar motivos que estén significativamente mas representados en uno de los clusters que en el otro). En este sentido, DAVID es una de las herramientas más completas ya que permite detectar enriquecimiento en diversos niveles de anotación: interacciones proteína-proteína, dominios funcionales, asociación con enfermedades, vías metabólicas, homología, patrones de expresión tejido-específicos, publicaciones en literatura, etc.

Para exportar una lista de identificadores a un archivo....

Cluster1=MiTablaSTD[which(MiCorte==1),]  #Guardo en la variable Cluster1 los genes que tienen asignado un "1" en el clustering jerárquico.
Cluster2=MiTablaSTD[which(MiCorte==2),]  #Guardo en la variable Cluster2 los genes que tienen asignado un "2" en el clustering jerárquico.
write(row.names(Cluster1),"Cluster1.ids") # escribo al un archivo externo "Cluster1.ids" los identificadores de los genes del cluster 1.
write(row.names(Cluster2),"Cluster2.ids") 

5. Análisis de Clustering de RNA-Seq de hoja de Maíz Hacer un análisis de clustering, ahora con el conjunto de datos maizeTranscDataMappedAt.csv. Este proviene de un estudio de transcriptómica por RNA-Seq de la hoja del maíz, durante su desarrollo desde la base hacia el ápice (Pinghua Li, et al 2010). La última columna de la tabla contiene el identificador del gen homólogo en Arabidopsis thaliana (si lo hubiera), para aprovechar el alto grado de anotación de este genoma en el análisis de enriquecimiento funcional de los clusters que se obtengan.

SUGERENCIA: Antes de calcular matrices de distancias entre genes, probar diferentes transformaciones sobre las medidas de expresión (RPKM) evaluando las distribuciones obtenidas (e.g. scale(x), log(x+1), (x-median(x))/IQR(x), t(scale(t(scale(x)))) )

MEDIDAS DE CALIDAD DE LOS CLUSTERS

Cuando queremos decidir qué método de clustering o qué función de distancia es mejor que otra, necesitamos de herramientas que nos permitan medir la calidad de los clusters y qué tan bien representan éstos la estructura natural de los datos. El coeficiente silueta (silhouette) mide cuan buena es la asignación de un elemento o dato a su cluster. Para esto compara las distancias de este elemento respecto a todos los demas elementos del cluster al que pertenece, contra las distancias respecto a los clusters vecinos. El coeficiente silueta del elemento i se denota s(i).

si s(i) ≈ −1, el dato i esta mal agrupado
si s(i) ≈ 0, el dato i está entre dos clusters
si s(i) ≈ 1, el dato i esta bien agrupado

El promedio de los s de los elementos dentro un cluster, da una idea de la calidad de ese cluster. El promedio de los s de todos los elementos dan una idea de que tan bien están agrupados todos los datos; si el clustering realizado es bueno o no.

En R se pueden computar facilmente los coeficientes silueta mediante la función silhouette() incorporada en la librería cluster:

library(cluster) # llamamos a la librería "cluster"
MiSiluetaKMeans = silhouette(MiClusteringKMeans$cluster,MiMatrizDeDistancias) # para un clustering por K-means o bien...
MiSiluetaJerarquico = silhouette(MiCorteDelArbol,MiMatrizDeDistancias) # para un clustering con hclust() - cutree()

Se pueden ver los coeficientes Silueta para todos los datos:

MiSiluetaKMeans

O un resumen con los promedios de Silueta de cada cluster:

summary(MiSiluetaKMeans)

También se puede hacer una representación gráfica de los coeficientes Silueta:

plot(MiSiluetaKMeans)

Este tipo de gráfico es una herramienta muy útil para determinar cuál es el número "natural" de clusters en un conjunto de datos. En este caso, probamos con K=5 y vemos que el cluster 1 (que contiene 203 genes) no es muy bueno ya que además de tener un coeficiente de silueta promedio bajo (0.13), muchos de los genes que contiene, tienen coeficientes de silueta negativos. Habría que probar con otro número K de clusters y/o con otro método de clustering.

EJERCICIO: Calcular los coeficientes silueta para los clusters encontrados en el dataset diauxic. Evaluar la silueta promedio para distintos números K de clusters.

BONUS TRACK

El set de datos fibro.data proviene de un experimento donde se analizan los cambios de expresión génica de fibroblastos humanos en respuesta al suero http://genome-www.stanford.edu/serum/.

El siguiente heatmap muestra los 7 clusters en los que los datos fueron agrupados mediante un clustering jerárquico utilizando el criterio de agregación de vecino mas lejano y una medida de distancias basada en correlación.

A contiunación se puede ver otra representación de los perfiles de expresión, ahora de cada cluster por separado, usando gráficos de perfiles multivariados o "parallel plots":

Esta de acuerdo con los grupos formados? partiría o fusionaría algunos clusters? Reproducir estos gráficos y probar con diferente número de clusters, utilizando además del método del Vecino mas lejano (complete linkage) el promedio (average) y evaluando las siluetas.

Y otra forma de representar los datos agrupados, mediante un diagrama de dispersión sobre las 2 primeras Componentes Principales:

código de R:

fibro=read.csv("fibro.data",sep="\t")
fibroClust=hclust(as.dist(1-cor(t(fibro))),method="complete") 
fibroCorte=cutree(fibroClust,7)
library(lattice) # traigo este paquete para generar el grafico parallel
library(gplots) # traigo este paquete para usar la escala de colores redgreen(75) en el heatmap
library(cluster) # traigo este paquete para calcular los coeficientes silueta
pdf("graficos_fibro.pdf")
heatmap(as.matrix(fibro),Colv=NA,distfun=function(c) as.dist(1-cor(t(fibro))),RowSideColor=as.character(fibroCorte),col=redgreen(75),cexRow=0.1)
parallel(~fibro | factor(fibroCorte),horizontal=FALSE)
fibro.std=t(scale(t(fibro)))
clusplot(fibro.std,fibroCorte)
plot(silhouette(fibroCorte,as.dist(1 - cor(t(fibro)))))
dev.off()

NOTA INSTALACIÓN DE PAQUETES EN R: Los paquetes utilizados en este TP son los que trae la instalación base de R (excepto el paquete gplots). Para ver los paquetes instalados:

>library()

Para cargar un paquete de la lista anterior (por ejemplo, el paquete cluster que utilizamos para calcular los coeficientes silueta ):

>library(cluster)

Para instalar un paquete no incluido en R base, por ejemplo gplots que trae herramientas adicionales para graficar datos :

>install.packages("gplots")

y luego lo cargamos normalmente:

>library(gplots)

Bioconductor? Hay un gran número de paquetes orientados específicamente al análisis de datos genómicos (en su mayoría aquellos derivados de microarrays de ADN, pero también de SAGE, SNPs, etc.) provenientes del proyecto Bioconductor. Por el momento, exceden los objetivos de este TP introductorio.
Attachments

    UnderConstruction.jpg (7.1 KB) - added by santiago 8 years ago.
    dendogramaEjemplo.jpg (12.7 KB) - added by santiago 8 years ago.
    diauxic_heatmap.jpg (35.8 KB) - added by santiago 8 years ago.
    diauxic_4clust_silhouette.jpg (26.2 KB) - added by santiago 8 years ago.
    MiTablaSTD_heatmap.jpg (9.6 KB) - added by santiago 8 years ago.
    diauxic.txt (38.6 KB) - added by santiago 8 years ago.
    fibro.data (33.1 KB) - added by santiago 8 years ago.
    fibro_heatmap.jpg (71.3 KB) - added by santiago 8 years ago.
    fibro_parallel.jpg (77.0 KB) - added by santiago 8 years ago.
    TablaEjemplo.txt (65 bytes) - added by santiago 8 years ago.
    IntroClustering2012.pdf (716.7 KB) - added by santiago 5 years ago.
    maizeTranscDataMappedAt.csv (3.0 MB) - added by santiago 4 years ago. "Maize leaf development RNA-seq (Pinghua Li, et al 2010). Gene mapping to A. thaliana"
    introDataMining2013.pdf (1.7 MB) - added by santiago 4 years ago. "Slides Intro Data Mining"
    fibro.cluplot.jpg (39.6 KB) - added by santiago 4 years ago.
    RNASeqFiles.tar.gz (2.4 MB) - added by laura 2 years ago.
    intro_R_UNSAM.pdf (726.3 KB) - added by emancini 13 months ago.

Download in other formats:

    Plain Text

Trac Powered

Powered by Trac 0.12.3
By Edgewall Software.

Visit the Trac open source project at
http://trac.edgewall.org/
