

# Introducción

La idea de esta actividad, es que sirva como una introduccion muy liviana a la tarea de programar una computadora enfocandonos en manipular datos biológicos. La primera parte de la guía es una introducción a conceptos básicos del lenguaje R, como escribir un programa, como ejecutarlo, almacenar y manipular datos en variables, etc. Siguiendo el estilo de la guía sobre Unix, no se espera que estén familiarizados con estos conceptos, en lo posible la guía los va a ir llevando ...

## Rstudio, nuestro pequeño espacio de desarrollo

Como les habrán explicado, todo el trabajo en R que se desarrolle durante el curso de la materia se realizará en el entorno de desarrollo *Rstudio-server*, en el cual operarán de forma remota solo a través del explorador de internet como si entraran a cualquier sitio web, de forma tal que podrán trabajar en la misma sesión tanto durante las clases como desde cualquier conmputadora con accesso a internet donde prefieran prácticar, repasar, o profundizar lo realizado en clase. 
Para acceder, simplemente entren al siguiente enlace:

[rserver](http://10.1.103.82:8787)

*Rstudio* les pedirá el usuario y contraseña que sus instructores ya deberían haberles asignado... Una vez que hayan ingresado exitosamente, les aparecerá una ventana como la siguiente:

![](Rserver_1.png)

*Rstudio* se divide en 4 paneles, acá solo aparecen 3 puesto que todavía no hemos abierto ningún archivo. Para empezar, creemos uno nuevo, basicamente lo que conocemos como "Script" que no es mas que un arhivo de texto "plano" con instrucciones para un lenguaje de programación especifico (en este caso R). Para ello, hagan click en "File", de la lista que desplega elijan "New file" y luego "R script". (Como verán hay muchas mas cosas que se pueden hacer en Rstudio, nosotros solo vamos a ver las mas básicas, pero sientanse libres de explorarlas si les genera interes. [Rstudio](https://www.rstudio.com/))

Ahora que hemos creado un nuevo *script* tenemos los cuatro paneles:

1. **Esquina superior izquierda:** Acá tenemos el script que acabamos de abrir (por ahora esta vacio) pero tambien podremos ver cualquier archivo nuevo o tabla que usemos en R, a medida que los vayamos abriendo *Rstudio* simplemente nos pondrá mas pestañas y podrán pasar libremente de una a la otra.

2. **Esquina inferior izquierda:** Acá tenemos la "consola" igual a la que ya vieron en UNIX, solo que esta solo entiende R. Cualquier cosa que escriban aqui, y luego presionen [ENTER] se ejecutará en el momento, y les mostrará el resultado de dicha orden. 

3. **Esquina superior derecha:** Acá tendrán una lista de todas las variables cargadas en el "entorno" que están trabajando, se les mostrará un pequeño resumen de cada variable y en el caso de las "tablas" que son muy grandes para mostrar pueden hacerles click y se abriran en una nueva pestaña del primer panel. Hay otras pestañas que pueden ser útil pero por lo pronto no son necesarias. Este panel será de gran ayuda para que no se pierdan en un mar de datos, es especialmente útil para los que estén programando por primera vez.

4. **Esquina inferior derecha:** Esté panel tiene varias pestañas útiles:
    * **Files** La primera es simplemente un explorador de archivos (igual que en windows) donde pueden navegar entre las carpetas disponibles y visualizar los arhivos que encuentren (Rstudio es muy versatil y pueden probar de abir archivos de texto (aparecerán en una nueva pestaña del primer panel), .pdf (se abrirá en una nueva pestaña del explorador), imagenes varias (.jpg, .png, etc). Les será muy útil para ver que tienen en su sesión de Rstudio mientras trabajan.
    * **Plots** Como su nombre indica, acá aparecerán todos los plots que vayan generando, mas adelante veremos mas detalles de esta pestaña.
    * **Help** Esta pestaña es **fundamental**, acá podrán acceder a toda la ayuda disponible de R y de todos los paquetes y funciones que quieran usar. Pueden buscar las funciones escribiendo en la "lupita" como en cualquier programa que conozcan o pueden ejecutar en la consola el comando `help()` (muy similar el comando man que ya usaron en UNIX), prueben con:

```R
help(print)
```

¿Entienden algo? :disappointed_relieved: **¿¡NO!?** 

Tranquilos, este texto de "ayuda" les irá siendo cada vez mas ameno a medida que se vayan familiarizando con el formato que tienen, sientanse libres de consultarle a sus instructores cualquier duda, pero sepan que en la práctica estos textos de ayuda solucionan una gran parte de los problemas del día a día.

Hay otras que probablemente necesiten usar durante el desarrollo de la cursada, como las opciones para manejar el explorador de archivos (pestaña *Files*) donde pueden crear carpetas, mover archivos, copiar archivos, e incluso descargar/subir archivos desde *Rstudio* a la computadora desde donde acceden. No es necesario que lo exploren ahora pero pueden probar algunos o ver si entienden como entrar y salir de carpetas, etc.


## Entrando en calor


Antes de comenzar con R, propiamente dicho, vayamos a la pestaña de *Files* y creemos una nueva carpeta "scripts", es una buena práctica trabajar cada proyecto dentro de una carpeta distinta (**FUNDAMENTAL**) e incluso mejor si dentro de estas creamos otras carpetas para archivos "temporales" *(/temp)*, "archivos finales" *(/output)*, archivos de entrada *(/input)*. U cualquier otra que se les ocurra necesaria.

¿Sabrian hacer esto desde la consola de UNIX, si fuese necesario? Sería algo así:

```BASH
mkdir scripts
cd scripts 
pwd #ubiquemos el directorio de trabajo
ls #chequear su contenido
```

Ahora vamos a la consola y pueden probar cosas sencillas como:

```R
print("hola mundo")
```
   
o

```R
2+2
```

Ya se imaginarán que podrán esperar de cada orden

Pero ¿y si quisieramos dejar un registro de lo que acabamos de hacer? En realidad R guarda todas las ordenes en un archivo que se llama .Rhistory, y ustedes lo pueden visualizar en el 2do panel en la pestaña *History*, sin embargo esta forma de almacenar instrucciones es un poco sucia, ya que se guarda TODO lo que se ejecuta, incluso lo que probamos y lo que hacemos mal.
Con lo cual en general se va dejando un registro de las ordenes correctas para llegar al *output* deseado e incluso se suelen comentar las instrucciones mas importantes para que se pueda entender por quien tenga la desgrac..digo la necesidad de reutilizar el código.
(En R, comentamos el texto anteponiendo un # a la linea deseada). Para esto es que creamos el archivo de texto (¿Recuerdan el "New Rscript"?) que probablemente se les haya abierto con el nombre *Untitled1*.

Prueben de escribir un sencillo comando y documentarlo:

```R
#Hola, estoy aprendiendo a programar:
cat("Hello World")
#No soy un cipayo:
cat("Hola mundo")
```
(¿Que es cat()? ¿se parece a algo que ya vieron? ¿como podrían investigarlo?)

Muy bien, tenemos las complejas instrucciones, ¿como la ejecutamos?
En *Rstudio* es tan sencillo como poner el cursor de escribir sobre la linea deseada y presionar [Ctrl] + [ENTER], inmediatamente dicha linea "pasa" a la consola y se ejecuta, maravilloso. Tambien podemos seleccionar varias lineas, o parte de ellas y presionar las mismas teclas, *Rstudio* entiende que si seleccionamos las lineas 4,5 y 6, tiene que ejecutarlas en ese orden una después de la otra, sus instructores tambien hacen la misma asunsión, por lo que si durante la cursada terminan ejecutando la linea 13, la 15 y luego la 4, y tienen algún error, probablemente sus instructores estén un poco confundidos al leer el *script* visualizando un orden secuencial distinto, es una muy buena práctica ejecutar el código del *script* de forma secuencial y en caso de hacer algún cambio en el orden ejecutado, reflejarlo de igual manera en el *script* donde están trabajando.

Tambien podríamos ejecutarlo desde BASH, para lo cual deberíamos guardar el archivo como “hello.R" en la carpeta “scripts" que hemos creado. Iríamos a la consola nuevamente, y parados en la carpeta scripts, podemos ejecutarlo de la siguiente manera:

```console
$ cd ~/scripts/
$ Rscript hello.R
Hello WorldHola mundo
```


Podemos mejorar la impresión simplemente agregando un “salto de carro" (se simboliza con “\\n") al final de la impresión:


```R
#Hola, estoy aprendiendo a programar:
cat("Hello World\n")
#No soy un cipayo:
cat("Hola mundo")
```

```console
$ Rscript hello.R
Hello World
Hola mundo
```
¿Notan la diferencia? Podriamos usar tambien otros caracteres como “\\t" (tabulacion), “\\s" (espacios):

### El mundo de las variables
#strings
Comenzaremos a explorar el uso de variables en R. En primer lugar una variable de tipo escalar (string). Por ejemplo, creamos una variable name, e imprimimos :

```R
name <- "Hermenejildo"
saludo <- paste("hola",name)
print(name)
print(saludo)
```
El signo de "<-" representa una flecha que indica donde esta el valor que le corresponde a la variable. Si la variable todavía no existía, se crea (la podrán ver aparecer en el 3er panel), y si en un nuevo comando vuelvo a indicarle un nuevo valor a esa misma variable, la variable se "olvida" del valor anterior. :eyes: (**Ojo con esto**)
Muchas veces es útil declarar las variables vacías y luego irlas “llenando" a medida que se va ejecutando el algoritmo. Por ejemplo, supongamos que queremos ingresar el nombre por consola:

```R
name <- ""
cat("What is your name?")
name <- readline()
cat(paste("\t hello", name,"\n\n"))
```
fijense que el cursor de la consola desapareció, (esta esperando que ingresen algo). Pueden escribirlo en la consola direcamtente o seleccionar algo del script y presionar [Ctrl]+[ENTER] como siempre. 

#Variables escalares
En el caso de las variables escalares es muy similar, pero lógicamente hay distintas funciones:

```R
# Quiero guardar un número y calcularle el logaritmo
val <- 42
log(val)
```

Con respecto a las comparaciones entre números y palabras podemos hacer las operaciones tradicionales: 

Para probar un poco: 
1. Usar 2 variables, asignar un número a cada una. Calcular la suma de ambas e imprimir por pantalla 
2. Usar diferentes operadores matematicos entre ellas, incluir una variable que sea 0 y probar la división. 
3. Ingresar una o ambas variables por consola 
4. Ingresar una o ambas variables por consola y preguntar al usuario que operación realizar entre ellas *(opcional)*
5. Ingresar 2 palabras, imprimir la longitud (nchar) de ambas y concatenarlas (usar funcion paste())

Ejemplo:

```R
print("Ingrese una cadena de DNA corta:")
dna1 <- readline()
print("Ingrese una cadena de DNA corta:")
dna2 <- readline()
print(paste("Las longitudes ingresadas son:",nchar(dna1),"y",nchar(dna2)))
#Podriamos tambien generar una tercer variable dna3 para concaternar las 2 anteriores:
dna3 <- paste(dna1,dna2)
# Imprimir las cadenas concatenadas
print(dna3)
#si no queremos el espacio entre las cadenas:
dna3 <- paste(dna1,dna2,sep="")
# Imprimir las cadenas concatenadas
print(dna3)
#si queremos separarlas con otro valor:
dna3 <- paste(dna1,dna2,sep="\t")
```

#Vectores

Es muy útil poder alacenar conjuntos ordenados de números, los cuales en R se llaman vectores.
Podemos generarlos de distintas formas, por ejemplo si usamos la función c(), podemos juntar todos los números, o variables con números que querramos:

```R
vector678 <- c(6,7,8)
```
Tambien podemos indicarle a R el primer y el último número de una serie consecutiva y automaticamente genera todo el resto:
R interpreta los dos puntos (:) entre números como una serie que tiene que complementar. Si quieren cosas mas complejas, como que vaya de 10 en 10, pueden revisar la documentación de la funcion seq, con `help(seq)`.

Por ejemplo quiero hacer un sencillo gráfico de una serie de números elevados al cuadrado

```R
serieDeNumeros <- 1:100 
x <- serieDeNumeros 
y <- serieDeNumeros ^ 2 
plot(x, y)
```
Quiero hacer muchos números aleatorios pero con una media en 15, una desviación estandar de 2,5 y una distibución normal.
```R
Snorm <- rnorm(mean=15,sd=2.5,n=1000)
hist(Snorm)
```

¿Obtuvieron los gráficos que hubieran esperado? ¿Fue sencillo graficar?


## Dataframes, las tablas en R.

Repasemos otro tipo de variables que vamos a usar mucho: **dataframes**

Hay varias formas para crearlas, la mas sencilla es con la función *data.frame()*

Por ejemplo:

```r
genes <- c("ERT2","TTR4","REC1")
escencialidad <- c(F,F,T)
expresiones <- c(100,1000,10000)
dt <- data.frame(gen=genes,escencial=escencialidad,expresion=expresiones) 
print(dt)
summary(dt) #Es especialmente útil para dataframes muy grandes, ya van a ver.
```
(¿Ven la *data frame* en el 3er panel? Pueden visualizarla si le hacen click. O escribiendo `View(dt)` en la consola)


Si quisieramos seleccionar una columna en particular de dicha dt, lo podemos hacer de las siguientes formas:

Usando el signo "$" despues del nombre de la dt:
```r
dt$gen

```
Indexando por el número de columna:

(En R, las tablas se indexan con corchetes, donde dentro se ingresan dos números separados por una coma, el primero es para las filas y el segundo para las columnas. Si uno de los dos no se escribe, se entiende que son todas las filas/columnas)

```r
dt[,1]
dt[,c(1,3)]
dt[,c(1:3)]
```

Tambien pueden seleccionar por el nombre de la columna:

```r
dt[,"gen"]
```

El indexado de filas por número es identico, pero en general se usa para hacer operaciones de filtrado lógicas o matematicas:

```r
# Todos los genes escenciales:
dt[dt$escencial ,]
# Todos los genes de mas de 100 de exp:
dt$expresion > 100 
# Nos devuelve un vector lógico con un "TRUE" en aquellos que cumplen dicha condición, con lo cual podemos filtrar la dt original:
dt[dt$expresion > 100 ,]
```


Existen muchisimas mas funciones para trabajar con *data frames*, que pueden explorar a su gusto. Además, existen *data tables*, muy similares pero con algunas funciones como filtros y selecciones incorporadas de otra forma mas sencilla pero, quizá, no tan intuitiva. Mas adelante en otra clase las trabajaremos.

# Listas

Las listas son otro tipo de variables, muy similares a los vectores pero que pueden contener distintos tipos de variables en contrario a los vectores que todos sus valores tienen que ser del mismo tipo. Es mas, si guardamos un vector con distintos tipos de variables, R automaticamente transforma todo al tipo de variable que pueda contener ambos.
Para que puedan verlo, prueben este ejemplo contrastante:

```r
vector_numeros <- c(3,4,7,13,45.3)
vector_strings <- c("hola","chau","perro")
vector <- c(vector_strings,vector_numeros)
print(vector)
list_numeros <- list(3,4,7,13,45.3)
list_strings <- list("hola","chau","perro")
list <- c(list_numeros,list_strings)
print(list)
```
¿Ven que aparecen comillas ("") en los números del vector que contiene tanto cadenas de texto como números? 
Esto es así puesto que R transforma los números a cadenas de texto para poder alacenarlos en el vector. ¿Que pasaría si ahora quisiera sumar dos números que se transformaron en texto? 
(si les interesa pueden probarlo, indexen el vector para sumar dos valores numericos trasnformados a cadena de texto y fijense que pasa)
La otra diferencia con los vectores es que las listas se indexan con doble corchete, es decir, para acceder al primer item de una lista hay que hacer ```nombre_de_mi_lista[[1]]```, para el segundo ```nombre_de_mi_lista[[2]]```, etc.

¿Cansados? :skull:

Tomen un poco de aire para oxigenar el cerebro antes de la siguiente sección, en el cual trataremos algunos ejemplos mas biológicos y aplicados usando R para asistirnos en la resolución de problemas que sería muy laborioso de trabajar exclusivamente manual.


#Trabajando con DNA:

Una de las funciones para generar vectores es la función split sobre una cadena de caracteres (string). El comando split tiene la sintaxis:


`strsplit(split= /pattern/, x = string)`

El *pattern* puede ser desde algo muy sencillo como una cadena de texto exacta (algo tan sencillo como "ATG", por ejemplo), hasta una expresión compleja que encuentra solo una forma particular de escribir genes de un determinado bicho. Pero esto se escribe con "expresiones regulares" que son un poco (bastante) complejas de entender y se excede de los alcances de este curso, sin embargo, saber de su existencia les puede ser muy útil si algún día necesitan "parsear" un archivo muy grande con datos y no hay otra alternativa. 

Ejemplos:

```R
DNA <- 'AAAAAAAAAAAATTTTTTTTTTTTTTT'
DNAvector <- strsplit(split="", DNA)
base1 = DNAvector[[1]][1] 

```
¿Que pattern estaría usando en este split?  (ayuda: busquen la ayuda, suele ser de ayuda)



Veamos el ejemplo de la clase:

$string= "Cell980.1 ATG Hypothetical 2.54 High";
@values =split(//, $string);

print $values[3],"\n";
($id, @values)=split(/\s/, $string);

print "$id\n";

Que contienen ahora $id y @values? Que pattern estaría usando en este split? Qué otros pattern se les ocurren que podemos usar? Entender la existencia de patrones en los archivos es una de las claves para el diseño de buenos scripts. La mayoria de los formatos de archivos en bioinformática están pensados de manera que sea sencillo manipularlos usando patterns. Recordar que vimos por ejemplo en los archivos FASTA el marcador “>" para indicar el comienzo del encabezado de una secuencias. Hay caracteres muy usados como por ejemplo “#","!","*" etc… Tambien palabras claves como veremos más adelante.

Otra función muy usada es la opuesta al "split", o sea “join". La misma permite a partir de un array generar un string. Recordemos la sintaxis:

$string= join(“character(s)",@list)

@list=("Cell980.1","ATG","Hypothetical","2.54","High");

$string=join("",@list);
$string2=join("||",@list);
$string3=join("*",@list);

print $string,"\n\n";
print $string2,"\n\n";
print $string3,"\n\n";

Revisemos cómo se ingresa información al script leyendo archivos. Primero debemos declarar un “filehandle", un nombre donde alojaré el archivo que voy a leer:

open(MYHANDLE, “ejercicio.txt")

Luego puedo ir leyendo las líneas. Recordar que en este caso, MYHANDLE será un array:

$line1=<MYHANDLE>;
$line2=<MYHANDLE>;

Esto se puede automatizar usando un bucle WHILE que irá leyendo línea a línea el archivo mientras exista la variable $line:

while ($line = <MYHANDLE>) {
print $line;
}
close MYHANDLE;

Una de las mayores fortalezas de Perl es su capacidad para parsear archivos (leer en un formato e imprimir en otro). Uno podría imprimir hacia el STOUT (Standard Output) como vimos en Linux, que es la pantalla o guardar en un archivo nuevo, ya sea desde dentro del script de Perl o guardando la salida por pantalla con el caracter “>". Esto es más sencillo pero traerá inconvenientes al momento que querramos producir más de un output del mismo script.

Para generar el archivo de salida desde el mismo Perl, hay que tomar la precaución de abrirlo y especificar si el archivo será creado de nuevo “>" o si agregaré la información generaada al final de un archivo (si existiera) “>>"

open(MYOUTPUTHANDLE,">somefile.txt")
print  MYOUTPUTHANDLE “Hello there";

open(MYOUTPUTHANDLE,">>somefile.txt")
print  MYOUTPUTHANDLE “Hello there";

Se entiende la diferencia?

Estos ejercicios paso a paso se encuentran en los slides.
fin entrada en calor ¶

En una segunda parte, utilizando los conceptos aprendidos van a escribir programas simples para manipular archivos conteniendo predicciones para genomas completos.
Ejercicios (segunda parte) ¶

    Transformar el output de InterProScan 

    InterProScan es un programa que analiza secuencias de proteínas utilizando distintos programas/algoritmos (hmmpfam, hmmsmart, fprintscan, hmmpir, coil, seg, blastprodom, profilescan, ...) y distintas bases de datos (Pfam, PROSITE, ProDom, ...) para caracterizarlas (tutorial). El output de InterProScan es un archivo de texto, tabulado (los campos están separados por TABs (\t en Perl), conteniendo las siguientes columnas:

    1. Gene ID, la proteína query, ej: Rv1876
    2. Checksum, calculado sobre la secuencia, ej: 098B6D7392A9CD60
    3. Length, el número de residuos de aa, ej: 159
    4. Algorithm, a qué programa corresponde este resultado, ej: HMMPfam
    5. Hit, objeto encontrado en la base de datos correspondiente, ej: PF00210
    6. Description, descripción de este objeto ej: Ferritin
    7. Start, inicio del hit, ej: 8
    8. End, fin del hit, ej: 144
    9. E-value, hace falta explicarlo?, ej: 8.2e-47
    10.T/F?, si es un falso positivo (F) o no, ej: T
    11. Date, fecha en la que se corrió InterProScan, ej: 30-Aug-2009
    12. !Interpro Acc, a qué objeto en la base de datos InterPro corresponde este hit, ej: IPR008331
    13. InterPro Desc, descripción de IPR008331 en InterPro
    14. interpro2GO, asignación automática de términos de la ontología GO 

    El objetivo es escribir un programa que lea el output de InterProScan (análisis del proteoma de M. tuberculosis H37Rv), identifique las columnas y produzca como resultado un nuevo archivo tabulado conteniendo:

    sólo los resultados de búsquedas sobre Pfam
    sólo los verdaderos positivos
    para proteínas de menos de 200 aa
    y que contenga los siguientes datos, en este orden:
        Gene ID
        Pfam accession 

    Ejercicios propuestos:

    Plantear un algoritmo
    Interpretar el código parseInterpro_incomp.pl
    Completar las secciones faltanes
    Ejecutar el script con los datos que corresponda e interpretar los resultados 

    Input: mtu-interpro-Aug-2009.csv.gz (para descomprimir: gzip -d filename)

    Leer miles de archivos en sólo unos segundos (una vez que se tiene el programa andando, claro) 

    TMHMM es un predictor de dominios trans-membrana. El programa recibe la secuencia de una proteína, y devuelve un archivo de texto con sus predicciones, incluyendo número y posición de las hélices trans-membrana. Ej. de la salida de TMHMM para una proteína integral de membrana de M. tuberculosis :

    # Rv0507 Length: 968
    # Rv0507 Number of predicted TMHs:  11
    # Rv0507 Exp number of AAs in TMHs: 257.32733
    # Rv0507 Exp number, first 60 AAs:  21.44959
    # Rv0507 Total prob of N-in:        0.45984
    # Rv0507 POSSIBLE N-term signal sequence
    Rv0507  TMHMM2.0        outside      1    21
    Rv0507  TMHMM2.0        TMhelix     22    41
    Rv0507  TMHMM2.0        inside      42   210
    Rv0507  TMHMM2.0        TMhelix    211   233
    Rv0507  TMHMM2.0        outside    234   247
    Rv0507  TMHMM2.0        TMhelix    248   270
    Rv0507  TMHMM2.0        inside     271   289
    Rv0507  TMHMM2.0        TMhelix    290   312
    Rv0507  TMHMM2.0        outside    313   331
    Rv0507  TMHMM2.0        TMhelix    332   354
    Rv0507  TMHMM2.0        inside     355   374
    Rv0507  TMHMM2.0        TMhelix    375   397
    Rv0507  TMHMM2.0        outside    398   760
    Rv0507  TMHMM2.0        TMhelix    761   783
    Rv0507  TMHMM2.0        inside     784   789
    Rv0507  TMHMM2.0        TMhelix    790   812
    Rv0507  TMHMM2.0        outside    813   821
    Rv0507  TMHMM2.0        TMhelix    822   844
    Rv0507  TMHMM2.0        inside     845   863
    Rv0507  TMHMM2.0        TMhelix    864   886
    Rv0507  TMHMM2.0        outside    887   890
    Rv0507  TMHMM2.0        TMhelix    891   913
    Rv0507  TMHMM2.0        inside     914   968

    NOTA: En el caso de proteínas con péptido señal, el predictor frecuentemente lo identifica como un dominio trans-membrana.

    El objetivo es escribir un programa que lea los 4012 archivos con las predicciones de TMHMM para cada proteína de la bacteria, y genere una lista de las que tienen al menos 1 dominio trans-membrana. Eso sí, hay que descartar los "dominios" localizados dentro de los primeros 60 resíduos, ya que se tratan de potenciales péptidos-señal. Ayuda: TMHMM genera un "warning" en esos casos.

    Ejercicios propuestos:

    Plantear un algoritmo
    Interpretar el código parse_tmhmm_incomp.pl
    Completar las secciones faltanes
    Ejecutar el script con los datos que corresponda e interpretar los resultados 

    Outputs TMHMM: Mtu_tmhmm.tar.gz

    Procesar un FASTA múltiple usando BioPerl (requiere instalación). El objetivo es escribir un programa que lea un archivo con las secuencias codificantes del genoma de Saccharomyces cerevisiae y filtre aquellas que contengan caracteres inválidos o sean redundantes/repetidas (en caso que hubiera). Además se pide traducir las secuencias nucleotídicas en el primer marco de lectura, e incluir en la descripción de la proteína de salida, su longitud (número de aminoácidos). 

    Ejercicios propuestos:

    Plantear un algoritmo
    Interpretar el código parseFasta_incomp.pl
    Completar las secciones faltanes
    Ejecutar el script con los datos que corresponda e interpretar los resultados 

    Secuencias codificantes de 'S. cerevisiae' con errores 

    Transformar el output de Glimmer y visualizarlo en Artemis 

    Glimmer es un predictor de genes procarióticos (un gene finder). Se utiliza, por ejemplo, para identificar genes en un genoma recién secuenciado (no anotado todavía). Glimmer debe ser entrenado sobre un set de genes conocidos y validados experimentalmente. Una vez hecho esto y generado un modelo de los genes que conoce, Glimmer busca genes nuevos en el genoma de interés.

    En este ejercicio vamos a analizar el output generado por Glimmer y vamos a transformarlo de manera de poder visualizarlo con Artemis.

    Recordar que Artemis muestra o grafica features y que generalmente estas features están incluídas en cualquier secuencia de DNA en formato EMBL o GenBank. El formato de estas tablas de features es el siguiente:

    GenBank feature table:

    FEATURES             Location/Qualifiers
         source          1..1525460
                         /organism="Campylobacter lari RM2100"
                         /mol_type="genomic DNA"
                         /strain="RM2100; ATCC BAA-1060D"
                         /culture_collection="ATCC:BAA-1060D"
                         /db_xref="taxon:306263"
         gene            1..1329
                         /gene="dnaA"
         gene            1462..2529
                         /gene="dnaN"
         gene            2539..4857
                         /gene="gyrB"

    EMBL Feature Table:

    FH   Key             Location/Qualifiers
    FH
    FT   source          1..1525460
    FT                   /organism="Campylobacter lari RM2100"
    FT                   /strain="RM2100; ATCC BAA-1060D"
    FT                   /mol_type="genomic DNA"
    FT                   /db_xref="taxon:306263"
    FT                   /culture_collection="ATCC:BAA-1060D"
    FT   gene            1..1329
    FT                   /gene="dnaA"
    FT   gene            1462..2529
    FT                   /gene="dnaN"
    FT   gene            2539..4857
    FT                   /gene="gyrB"

    El formato es estricto y requiere que el feature Key empiece en la posición 6 de la línea, y que el siguiente bloque de texto (location/qualifiers) comience en la posición 23 de la línea. En el formato EMBL cada linea debe empezar con dos caracteres en mayúsculas, que identifican que tipo de información contiene cada línea.

    Otro formato que puede usarse para describir features y que Artemis también lee y entiende, es el llamado formato GFF (Generic Feature Format), ideado en el Sanger Centre. Detalles sobre el formato pueden leerse aquí.

    Features in GFF format:

    campylobacter-lari    source    gene    1    1329    .    +    .    ID=dnaA
    campylobacter-lari    source    gene    1462    2529    .    +    .    ID=dnaN
    campylobacter-lari    source    gene    2539    4857    .    +    .    ID=gyrB

    El ejercicio consiste en:

    Visualizar en Artemis las predicciones generadas por Glimmer sobre el de M. tuberculosis H37Rv. El output que genera Glimmer es tabulado, pero no se ajusta a ninguno de los formatos que entiende Artemis. Por lo tanto deberán escribir un programa (esta vez sin modelo), que transforme el output de Glimmer en alguno de los mencionados arriba. 

    Una vez resuelto el punto anterior y para ganar bonus points en nota de concepto, modificar el programa de manera que las distintas predicciones de Glimmer se vean en Artemis en distintos colores de acuerdo al score de la predicción. De acuerdo al manual de Artemis, es posible especificar el color de un feature, usando como qualifier la palabra mágica colour seguida del número correspondiente al color que uno quiera (el Sanger Centre queda en Inglaterra, por eso los colores son colours y no colors, cosas de ingleses). La tabla de colores y números que tienen asignados está en esta sección del manual. 

    Ayudita: hay que poner colour=## donde y como corresponda.

    Discutir las soluciones (los programas) escritos por cada uno. Analizar puntos fuertes, débiles, etc. 

    Archivos:

    El genoma de ''M. tuberculosis'' H37Rv
    Las predicciones de Glimmer 

Attachments

    mtu-interpro-Aug-2009.csv.gz (789.3 KB) - added by fernan 8 years ago. "InterProScan? raw output for M. tuberculosis H37Rv"
    mtuberculosis-h37rv.fasta (4.3 MB) - added by fernan 8 years ago. "El genoma de M. tuberculosis H37Rv"
    mtu.glimmer.predict (79.4 KB) - added by fernan 8 years ago. "Predicciones de Glimmer sobre el genoma de M. tuberculosis"
    Mtu_tmhmm.tar.gz (291.4 KB) - added by santiago 7 years ago. "Outputs de TMHMM para el proteoma de M. tuberculosis"
    parseFasta_incomp.pl (1.6 KB) - added by santiago 5 years ago.
    Sce_nuc_bad.fasta.zip (2.9 MB) - added by santiago 5 years ago.
    parseInterpro_incomp.pl (365 bytes) - added by santiago 5 years ago.
    parse_tmhmm_incomp.pl (1.0 KB) - added by santiago 5 years ago.
    glimmer2embl_incomp.pl (2.7 KB) - added by santiago 5 years ago.
    perlProgramming-2012.pdf (580.0 KB) - added by fernan 5 years ago. "Perl Programming 2012"


