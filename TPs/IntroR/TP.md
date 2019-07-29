

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

```shell
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

## El mundo de las variables
###strings
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

### Variables escalares
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

### Variables lógicas

Son las mas sencillas de todas, basicamente solo almacenan un 1 o 0, que solemos escribir como TRUE o FALSE, o T o F. (R entiende todos)
Son de especial interes cuando trabajamos con evaluaciones lógicas, algo que se hace muy frecuente, por ahora solo sepan que existen como tipo de variable.

```r
variable_logica <- T
print(variable_logica)

variable_logica <- TRUE
print(variable_logica)

variable_logica <- as.logical(1)
print(variable_logica)

```

### Vectores

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


### Dataframes, las tablas en R.

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

* Usando el signo "$" despues del nombre de la dt:
```r
dt$gen

```
* Indexando por el número de columna:

(En R, las tablas se indexan con corchetes, donde dentro se ingresan dos números separados por una coma, el primero es para las filas y el segundo para las columnas. Si uno de los dos no se escribe, se entiende que son todas las filas/columnas)

```r
dt[,1]
dt[,c(1,3)]
dt[,c(1:3)]
```

* Tambien pueden seleccionar por el nombre de la columna:

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

### Listas

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

## Iteraciones y evaluaciones usando R

Una de las cosas mas útiles, pero a su vez dificil de comprender, son las evaluaciones e iteraciones. 

### Evaluaciones en R

Una evaluación es basicamente un comando que se ejecuta solo si se cumple alguna condición, la estructura que tenemos que escribir en R para hacer evaluaciones es la siguiente:

```r
valor <- 34
if(valor > 10){
  print("el valor es mayor a 10")
}else{
  print("el valor es menor a 10")
}

```
¿Como se entiende esto? Entre parentesis hacen una evaluación, pueden usar "<", ">", "==", ">=" o "<=". (Se usa "==" para diferenciarlo de "=" que como ya vieron se puede usar para asignar variables), aunque tambien pueden usar otras funciones que devuelvan variables logicas como `identical()` o cualquier función que ustedes hayan escrito (lo veremos mas adelante en este TP). Tambien pueden usar variables que contengan un valor lógico, de una forma muy similar podríamos haber escrito el ejemplo anterior:

```r
valor <- 34
evaluacion <- valor > 10
if(evaluacion){
  print("el valor es mayor a 10")
}else{
  print("el valor es menor a 10")
}
```



### Iteraciones con for y while:

Las iteraciones son basicamente ordenarle a nuestra computadora, que ejecute ciertas acciones reiteradas veces. Hay dos formas mas usadas, una es mediante `for` y la otra es con `while`. 
* iteraciones con `for`:
La idea es que se programan ciertas instrucciones para cada uno de los elemenos de un vector. Por ejemplo, calcular el logaritmo de todos los números de un vector en particular sería:
```r
vector_de_numeros <- c(1:100)
for (i in vector_de_numeros) {
  print(log(vector_de_numeros[i]))
}
```
La estructura del for es la siguiente: entre parentesis, tenemos que variable va a tomar los distintos valores del vector (en este caso, la variable es i y el vector son los números del 1 al 100) y entre llaves, tenemos que código se debe ejecutar. En cada una de las iteraciones del for, i tendrá un valor distinto y por ende el código que se va a ejecutar es ligeramente distinto.

* iteraciones con `while`:
La estructura es muy similar, sin embargo, el concepto es distinto. Este iterador ejecuta el código entre llaves, **hasta** que se cumple cierta condición. Por ejemplo lo mismo que hicimos anteriormente con el `for`, sería:

```r
vector_de_numeros <- c(1:100)
i <- 1
while (i <= length(vector_de_numeros)) {
  print(log(vector_de_numeros[i]))
  i <- i + 1
}
```
Ambas pueden resolver cualquier problema que ustedes necesiten iterar, en algunos casos será mas fácil o intuitivo de resolver con un `for` y otras veces con un `while`, sin embargo recomiendo que si van a usar el segundo, presten mucha atención a no escribir un código que genere un **loop infinito**. Esto es, cuando la condicion nunca se cumple y el código se ejecuta eternamente. Puesto que de ser así habrán "colgado" R y tendrán que reiniciarlo o interrumpirlo para volver a programar. Esto sucedería si por ejemplo en el ejemplo anterior, no hubiesen puesto la linea que aumenta el valor de `i`.

### Integrando ambas:

Es muy frecuente tener que integrar evaluaciones e iteraciones, por ejemplo, siguiendo el ejemplo de expresión que usamos antes, podríamos pedirle a R que exporte un archivo .txt con los IDs de genes de la tabla, que sean escenciales (resulta muy sencillo con una dt de 3 genes, pero los quiero ver con un genoma entero, replicas y distintos tratamientos).
En este caso tendríamos que iterar cada observación de `dt` y evaluar si es o no escencial:

```r
for(i in 1:length(dt[,1])){
  if(dt[i,]$escencial == T){
    print(dt[i,]$gen)
  }
}
```




## Cargando datos a R

Algo muy interesante que siempre necesitamos es pasar datos de distintos formatos y cargarlos en nuestro *Rstudio* para trabajarlo, claramente no podemos ingresar un gen de forma manual, ni miles de registros de una base de datos...o podemos pero no nos conviene.
Por un lado los datos mas fáciles de cargar son los del estilo de tablas separadas por valores especificos, como "comas" (,) o "tabs" (\\t). En esos casos tenemos la función `read.table()` que se encarga de hacerlo de forma muy sencilla, eso si, hay que saber bien que formato tiene el archivo que queremos cargar.

Supongamos que tenemos un archivo con valores de expresión, donde las columnas están separadas por tabs y se llama "resultados_ensayo1.tsv". La funcion para cargarlo y guardarlo en una *dataframe* sería:

```r
dt_exp <- read.table(file="resultados_ensayo1.tsv",sep="\t")
```

Pero la vida no siempre es tan feliz, muy frecuentemente nos encontramos con que los datos con los que tenemos que trabajar tienen un formato no estandar. En esos casos nos encontramos con que es necesario leer linea a linea el archivo y darle formato, en la próxima sección del TP nos enfocaremos en ver ejemplos de esto y como se pueden trabajar.

Para empezar, les adelantamos que lo fundamental es que R nos permite leer cualquier archivo de texto, linea por linea, usando el siguiente comando:


## Funciones y paquetes en R

Una de las posibilidades mas importantes que pueden aprovechar de R es que todo se pueda hacer en una función. Y las funciones, debido a nuestra formación, nos resultan intuitivas. Por ejemplo todos entienden que si les digo f(x) = 2 x + x^2. Saben que f(x) es una función que recive números (x) y devuelve el resultado de una operación. Ahora en R eso se escribiría de la siguiente forma:

```r
my_function = function(x) {
  return(2 * x + x ^ 2)
} 
```
Y si quisiera llamar a la función con distinos "x" sería muy sencillo:
```r
x_1 <- 10
my_function(x_1)
x_vector_1 <- 1:100
y_vector_1 <- my_function(x_vector_1)  
plot(x_vector_1,y_vector_1)
```
Esto nos ahorra tener que escribir muchas veces el mismo código cuando vamos a operar mas o menos de la misma forma reiteradas veces. Digo mas o menos porque el uso de funciones es muy versatil, en el ejemplo anterior nosotros declaramos que la función solo recibía una variable "x", pero tranquilamente yo podría haber sido mas complejo:

```r
my_function = function(x,exp) {
  return(2 * x + x ^ exp)
} 
```

```r
x_vector_1 <- 1:100
y_vector_1 <- my_function(x_vector_1,2)  
plot(x_vector_1,y_vector_1)
y_vector_1 <- my_function(x_vector_1,20)  
plot(x_vector_1,y_vector_1)

```
Y las funciones no solo se limitan a operaciones matematicas, pueden escribir cualquier tipo de operación con cadenas de texto, manejar archivos, realizar test estadisticos, etc. Solo están limitados por su creatividad.

Seguramente estarán pensando que esto es mucho trabajo para realizar algo que tranquilamente podrían encontrar resuelto on-line...y la verdad es que tienen razón, estos ejemplos tan sencillos son solo ilustrativos. Cuando queremos resolver un problema que no es particular y explusivo de nuestro trabajo, sabemos que es mas que probable que alguien lo haya resuelto antes (por ejemplo realizar test estadísticos) y R esta desarrollado bajo esa premisa, y como es *open source* casi todo lo que se desarrolla en R se dispone libremente en internet...de forma tal que nosotros podemos aprovecharlo y usarlo en nuestro trabajo sin tener que ponernos a codear funciones complejas. (e incluso muchas veces quienes las desarrollan son mas idoneos para hacerlo y nos acercan un trabajo mas eficiente y/o de mejor calidad que lo que nosotros podríamos hacer).
Por esto es que en R tenemos la posibilidad de cargar "paquetes" que dentro tienen un conjunto de funciones, siempre referidas a algún tipo de problema en particular. Muchas de estas funciones como `print()` o `paste()` son básicas de R y ya las tenemos instaladas y cargadas en R por defecto, sin embargo, esto no ocurre así para cosas mas particulares de nuestro trabajo como por ejemplo trabajar con secuencias de ADN, RNA, proteinas donde ya hay gran cantidad de funciones que resuelven nuestras necesidades y se encuentran en paquetes que podemos cargar libremente.
Oro ejemplo, es si uno tiene intención de realizar plots de buena calidad, podría usar las funciones básicas de R como `plot()`, sin embargo hay algunas cosas que se vuelven un poco engorrosas. Y por esto es que desarrollaron un paquete muy extendido y usado llamado "ggplot", en nuestro sistema ya esta instalado y simplemente les mostraremos un ejemplo para que vean los alcances de usar paquetes:

Supongamos que mido dos solutos a 5 concentraciones distintas y obtengo dos curvas de calibración y quiero presentarle a mi director los resultados en un formato agradable e intuitivo de comprender:

```r
dt <- read.csv(file="./data/TP_introR/dt_TP1_cal.tsv",sep="\t")  #Cargamos los datos
library(ggplot2) # Cargamos el paquete que necesitamos
ggplot(data=dt,aes(x=log(con),y=abs,col=sol))+
  geom_point()+
  geom_smooth(method="lm")+
  theme_minimal()
```
Como pueden ver, este paquete tiene funciones que son un poco distintas a las que veníamos usando, pero creanme decirles que para los que solemos usarlas se vuelven fáciles de usar, a priori, fijense que solo tuve que decirle que los datos estaban en la *data frame* `dt`, que el eje x era el logaritmo de la columna "con", que el eje y era la columna "abs" y que los datos se dividen en grupos por la columna "sol", y luego le pedí que use la función especifica para este tipo de gráficos, `geom_smooth()`. Automaticamente hizo un análisis de regresión lineal, calculo una formula y los intervalos de confianza (por defecto usa IC95, pero se podría cambiar) que son las zonas sombreadas al rededor de la lineas de la regresión lineal. la función `geom_point()` agrega los puntos de cada recta, fijense como ambas funciones respetan los mismos valores de eje x, y y grupos de datos que previamente se define en `ggplot()`.
Todo esto realizado en tres lineas de código resulta un poco complejo ahora mismo, pero sepan que es un ejemplo que facilmente podrían haber tomado de algun tutorial de internet, por ejemplo podrían haber arribado al código de arriba siguiendo lo que explican [acá](https://sejohnston.com/2012/08/09/a-quick-and-easy-function-to-plot-lm-results-in-r/)





:skull: **¿Cansados?** :skull:

## Segunda sección del TP

R es muy útil a la hora de implementar visualizaciones de datos, análisis estadisticos, data mining, etc. Por lo que tendrémos una clase especifica para que puedan ver y probar ejemplos donde R les puede ser de gran ayuda para mejorar o facilitar el trabajo de análisis de datos. Sin embargo tambien puede ser útil en otros tipos problemas. Por ejemplo es muy normal que en trabajos de biología sea necesario trabajar datos provenientes de servicios o equipos que no generan *outputs* de formato estandar (separados por tabs, comas, etc) y cuando querramos cargarlos en cualquier programa de análisis de datos, tengamos que darles formato manualmente...algo que no es muy complicado cuando se trata de unos pocos archivos o un ensayo, pero que puede ser complicado o imposible en grandes cantidades.

Aun cuando los formatos que querramos trabajar no tengan el formato estandar que esperamos, suelen tener algún tipo de formato propio, y eso genera que haya patrones en el archivo. Entender la existencia de patrones en los archivos es una de las claves para el diseño de buenos scripts. La mayoria de los formatos de archivos en bioinformática están pensados de manera que sea sencillo manipularlos usando *patterns*, otros hay que trabajarlos un poco mas.
Recordar que vimos por ejemplo en los archivos FASTA el marcador “>" para indicar el comienzo del encabezado de una secuencias. Hay caracteres muy usados como por ejemplo “#","!","*" etc… Tambien palabras claves como veremos más adelante.

Una de las funciones claves para explotar estos *patterns* es la función `strsplit()` sobre una cadena de caracteres (string). El comando strsplit tiene la sintaxis:


`strsplit(split= /pattern/, x = string)`

El *pattern* puede ser desde algo muy sencillo como una cadena de texto exacta (algo tan sencillo como "ATG", por ejemplo), hasta una expresión compleja que encuentra solo una forma particular de escribir genes de un determinado bicho. Pero esto se escribe con "expresiones regulares" que son un poco (bastante) complejas de entender y se excede de los alcances de este curso, sin embargo, saber de su existencia les puede ser muy útil si algún día necesitan "parsear" un archivo muy grande con datos y no hay otra alternativa. 
Como su nombre lo indica, la función devuelve el string que le pasamos, pero "partido" donde encontró el *pattern* que le dimos.

Ejemplos:

```R
DNA <- 'AAAAAAAAAAAATTTTTTTTTTTTTTT'
DNAvector <- strsplit(split="", DNA)
base1 = DNAvector[[1]][1] 
base10 = DNAvector[[1]][10] 
```
¿Qué pattern estaría usando en este strsplit?  (ayuda: busquen la ayuda, suele ser de ayuda)
¿Qué tipo de variable devolvió la funcion *strsplit()*?


Veamos otro ejemplo:

```r
string <- "AAC82598.2 Pol, partial [Human immunodeficiency virus 1]"
values <- strsplit(string," ")
id <- paste(values[[1]][1],collapse=" ")
values <- paste(values[[1]][-1],collapse=" ")
```

¿Qué contienen ahora `id` y `values`? ¿Qué *pattern* estaría usando en este split? ¿Qué otros *pattern* se les ocurren que podemos usar? ¿Que sucedió al volver a asignarle un valor a `values`?

¿Y si tengo un vector con muchisimos IDs de genes? (acá simplificaremos a 3) ¿Será mucho mas dificil encontrar los IDs? 

```r
string <-c("AAC82598.2 Pol, partial [Human immunodeficiency virus 1]","AAD20388.1 Vpu [Human immunodeficiency virus 1]","AAC82597.1 Nef [Human immunodeficiency virus 1]")
values <- strsplit(string," ")
id_1 <- paste(values[[1]][1],collapse=" ")
id_2 <- paste(values[[2]][1],collapse=" ")
id_3 <- paste(values[[3]][1],collapse=" ")
vector_of_ids <- c(id_1,id_2,id_3)
print(vector_of_ids)
```

Como ven, strsplit nos devuelve una lista donde cada uno de los elementos de la lista tiene un vector con todas las partes del string que partio en pedazos. Ahora pudimos tomar la parte que nos interesa de cada elemento y guardarlo en nuevas variables. Esto, sin embargo se puede hacer todavía mas sencillo si aprovechamos una función que trabaja las listas y de forma automatica podemos tomar todos los primeros elementos de una lista:

```r
string <-c("AAC82598.2 Pol, partial [Human immunodeficiency virus 1]","AAD20388.1 Vpu [Human immunodeficiency virus 1]","AAC82597.1 Nef [Human immunodeficiency virus 1]")
values <- strsplit(string," ")
vector_of_ids <- unlist(lapply(values, `[[`, 1))
print(vector_of_ids)
```
Este último código funcionaría igual tanto para estos 3 Ids como para miles, siempre y cuando todos sigan el mismo patrón.
En este ejemplo solo me quedé con el Id, pero tranquilamente podríamos haber almacenado el resto de la información, si nos fuese necesario. ¿Ven el alcance de entender este tipo de trabajos con programación? Lleva un poco de tiempo hacerlo, pero una vez terminado, toma el mismo trabajo analizar 10, 100 o 10.000 genes, ampliando muchisimo sus capacidades de analisis.
Es importante recalcar que todo este trabajo de "parsear" archivos lo pueden desarrollar en otro lenguajes de programación como python (sería similar a R), perl (en estos casos suele ser un poco mas sencillo y eficiente) o incluso en UNIX. (sería un poco mas complejo de escribir, pero la eficiencia sería muchisimo mayor, es muy útil si se quiere trabajar millones de datos en poco tiempo) 



### Parseando arhivos de salida del FilterMax 

Como ejemplo real de algo que podría serles de ayuda en su trabajo como biotecnologos. Tomemos el ejemplo de usar datos del equipo *Filter Max * que se dispone para uso de los que trabajan en el IIB. Este equipo es muy usado puesto que permite hacer mediciones puntuales de absorbancia, fluorescencía (y mas) en placas de wells de 96, 384 y 1536. Inluso te permite hacer mediciones en disntintos tiempos (se le puede programar para hacer mediciones cada cierto intervalos de tiempo).
Por lo tanto, se podrán imaginar que puede generar una gran cantidad de datos en un solo ensayo si por ejemplo hacemos mediciones cada 5 minutos durante una hora en una placa de 384 wells. Como es el ejemplo real que vamos a trabajar donde se intenta dilucidar la cinética de una enzima. 

El investigador realiza un ensayo donde evalúa cada 5 minutos durante 1 hora (12 mediciones por placa) una placa de well donde en cada columna dispuso 16 concentraciones seriadas de 12 compuestos con dos repeticiones de cada compuesto. Un detalle de esto lo pueden ver [https://docs.google.com/spreadsheets/d/1PyeXGspSukMF2aqRmuC3eGms7nzw_FAVHcDBpF8q0rQ/edit?usp=sharing](esta planilla).
La enzima que estudia tiene como producto un compuesto fluorescente y la idea es calcular la regresión lineal a lo largo del tiempo, con la cual podemos estimar la velocidad de la reacción para todas las concentraciones de la reacción llevada a cabo con los distintos compuestos, que podrían actuar como inhibidores. Por lo tanto, luego de realizar el ensayo hay qeu calcular todas las RL, obtener el R2 de cada una (como control), y luego ver cual es la dosis/respuesta de cada compuesto a lo largo de las concentraciones ensayadas (esto es, obtener el IC50 y el coeficiente de Hill)

Luego de pipetear todo un 31 de diciembre de lluvia torrencial, se encontró con que las opciones de salida del FilterMax eran dos y la primera en formato excel, al cual esta acostumbrado a trabajar. Sin embargo, al intentar exportarlo, le dió un error: "los datos están incompletos". Sin poder entender a que se debía este error, exportó el archivo al otro formato disponible, un archivo .txt con un formato un poco particular. Pueden ver el ejemplo en el archivo "datos_filtermax.txt".
Se llevo el archivo generado en un pendrive a su casa, y esta vez si pudo cargarlo en un excel, sin embargo, otra vez se encuentra con dificultades puesto que como verán en el archivo, los datos de un mismo compuesto están en distintas columnas (A1, B1, C1, etc) y en excel tiene que realizar muchos "copy paste" hasta obtener todas series de concentraciones de cada compuesto para cada tiempo.
Al finalizar de formatear los datos, los tiene que ingresar en el programa Graphpad que le permite calcular las propiedades dosis/respuesta enviar los resultados a su director, y poder disfrutar del fin de año con su familia. ¿Puede terminar antes de las 10 de la noche? Aclaramos que empieza a analizar los datos a las 10 AM y además de la que ustedes tienen, hay 12 placas mas analizadas con el mismo diseño experimental y formato de salida.

¿Podemos agilizar el análisis usando R?

¿Como plantearían el análisis?

Intenten resolver el problema ustedes mismos en un nuevo script de R, y en caso de no poder, tienen el ejemplo resuelto en el archivo "Analisis_filerMax_resuelto.R".
