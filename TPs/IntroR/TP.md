

# Introducción

La idea de esta actividad, es que sirva como una introduccion muy liviana a la tarea de programar una computadora enfocandonos en manipular datos biológicos. La primera parte de la guía es una introducción a conceptos básicos del lenguaje R, como escribir un programa, como ejecutarlo, almacenar y manipular datos en variables, etc. Siguiendo el estilo de la guía sobre Unix, no se espera que estén familiarizados con estos conceptos, en lo posible la guía los va a ir llevando ...

## Entrada en calor

Como les habrán explicado, todo el trabajo en R que se desarrolle durante el curso de la materia se realizará en el entorno de desarrollo *Rstudio-server*, en el cual operarán de forma remota solo a través del explorador de internet como si entraran a cualquier sitio web, de forma tal que podrán trabajar en la misma sesión tanto durante las clases como desde cualquier conmputadora con accesso a internet donde prefieran prácticar, repasar, o profundizar lo realizado en clase. 
Para acceder, simplemente entren al siguiente enlace:

[rserver](http://10.1.103.82:8787)

*Rstudio* les pedirá el usuario y contraseña que sus instructores ya deberían haberles asignado... Una vez que hayan ingresado exitosamente, les aparecerá una ventana como la siguiente:

![](Rserver_1.png)

*Rstudio* se divide en 4 paneles, acá solo aparecen 3 puesto que todavía no hemos abierto ningún archivo. Para empezar, creemos uno nuevo, basicamente lo que conocemos como "Script" que no es mas que un arhivo de texto "plano" con instrucciones para un lenguaje de programación especifico (en este caso R). Para ello, hagan click en "File", de la lista que desplega elijan "New file" y luego "R script". (Como verán hay muchas mas cosas que se pueden hacer en Rstudio, nosotros solo vamos a ver las mas básicas, pero sientanse libres de explorarlas si les genera interes. [Rstudio](https://www.rstudio.com/))

Ahora que hemos creado un nuevo *script* tenemos los cuatro paneles:

1. **Esquina superior izquierda:** Acá tenemos el script que acabamos de abrir (por ahora esta vacio) pero tambien podremos ver cualquier archivo nuevo o tabla que usemos en R, a medida que los vayamos abriendo *Rstudio* simplemente nos pondrá mas pestañas y podrán pasar libremente de una a la otra.

2. **Esquina inferior izquierda:** Acá tenemos la "consola" igual a la que ya vieron en UNIX, solo que esta solo entiende R. Cualquier cosa que escriban aqui, y luego presionen [ENTER] se ejecutará en el momento, y les mostrará el resultado de dicha orden. Pueden probar cosas sencillas como:



```R
print("hola mundo")
```
   
o
```R
2+2
```
Ya se imaginarán que podrán esperar de cada orden

3. **Esquina superior derecha:** Acá tendrán una lista de todas las variables cargadas en el "entorno" que están trabajando. Hay otras pestañas que pueden ser útil pero por lo pronto no son necesarias. Este panel será de gran ayuda para que no se pierdan en un mar de datos, es especialmente útil para los que estén programando por primera vez.

4. **Esquina inferior derecha:** Esté panel tiene varias pestañas útiles:
..1. La primera es simplemente un explorador de archivos (igual que en windows) donde pueden navegar entre las carpetas disponibles visualizar los arhivos que encuentren (Rstudio es muy versatil y pueden probar de abir archivos de texto (aparecerán en una nueva pestaña del primer panel), .pdf (se abrirá en una nueva pestaña del explorador), imagenes varias (.jpg, .png, etc). Les será muy útil para ver que tienen en su sesión de Rstudio mientras trabajan.
..2. La segunda es "Plots", como su nombre indica, acá aparecerán todos los plots que vayan generando, mas adelante veremos mas detalles de esta pestaña.
..3. Help: Esta pestaña es **fundamental**, acá podrán acceder a toda la ayuda disponible de R y de todos los paquetes y funciones que quieran usar. Pueden buscar las funciones escribiendo en la "lupita" como en cualquier programa que conozcan o pueden ejecutar en la consola el comando `help()`, prueben con:

```R
help(print)
```

¿Entienden algo? :disappointed_relieved: **¿¡NO!?** 
¿Que informacion nos da cada comando (recordar comando man)? ¿Cuál es el que nos da la información para poner en la primera línea del script?

Antes de comenzar con Perl, vayamos a la consola y establezcamos como directorio de trabajo la carpeta donde guardaremos los scripts. Es una buena práctica crear una carpeta para ello, por ej:

mkdir scripts
cd scripts 
pwd #ubiquemos el directorio de trabajo
ls #chequear su contenido

Ahora abrimos un editor y ponemos en la primera línea la ruta absoluta del interprete Perl:

#!/usr/bin/perl

y una instrucción sencilla para ejecutar:

print “Hello world!”;

Guardemos el archivo como “hello.pl” en la carpeta “scripts” que hemos creado. Vayamos a la consola nuevamente, y parados en la carpeta scripts chequeamos su contenido, debería aparecer el script. Podemos ejecutarlo de 2 maneras:

Invocando a Perl:

perl hello.pl

O haciéndolo ejecutable. Recordar que debemos cambiar el modo (chmod u+x hello.pl).

./hello.pl

Podemos mejorar la impresión simplemente agregando un “salto de carro” (se simboliza con “\n”) al final de la impresión:

print “Hello world!\n”;

¿Notan la diferencia? Podriamos usar tambien otros caracteres como “\t” (tabulacion), “\s” (espacios):

print “\t Hello world!\n\n”;

Comenzaremos a explorar el uso de variables. En primer lugar una variable de tipo escalar (string). Por ejemplo, creamos una variable $name, e imprimimos :

my $name= “Azucena”;
print “\t Hello $name!\n\n”;

Muchas veces es útil declarar las variables vacías y luego irlas “llenando” a medida que se va ejecutando el algoritmo. Por ejemplo, supongamos que queremos ingresar el nombre por consola (<STDIN>):

my $name= ‘’;
print “What is your name?\t”;
$name=<STDIN>;
print “\t Hello $name!\n\n”;

Otra buena práctica ir comentando las líneas de código para saber qué propósito tiene cada “estamento”. El caracter "#" le indica a Perl que lo que está a continuación deber ser ignorado:

my $name= ‘’;
print “What is your name?\t”; #aca el usuario debe ingresar el nombre por consola:

$name=<STDIN>; #removemos el salto de linea antes de imprimir

chomp $name ; #ahora si podemos imprimir de manera prolija

print “\t Hello $name!\n\n”;

En el caso de las variables escalares que vimos en clase:

$var =”GGATCCGGACCAAA”; 
$val= 42;
($a,$b,$c)= (“me”,”my”,”mine”);

Con respecto a las comparaciones entre números y palabras podemos hacer las operaciones tradicionales: (ver diapo 17).

Para probar un poco: 1.- Usar 2 variables, asignar un número a cada una. Calcular la suma de ambas e imprimir por pantalla 2.- Usar diferentes operadores matematicos entre ellas, incluir una variable que sea 0 y probar la división. 3.- Ingresar una o ambas variables por consola 4.- Ingresar una o ambas variables por consola y preguntar al usuario que operación realizar entre ellas 5.- Ingresar 2 palabras, imprimir la longitud (length) de ambas y concatenarlas (usar operador .)

Ejemplo:

print "Ingrese una cadena de DNA corta: ";
$dna1 = <STDIN>;
print "Ingrese otra cadena de DNA: ";
$dna2 = <STDIN>;
# Remover la nueva linea al final de $dna1 antes de concatenar
chomp $dna1; 
# Concatenar los 2 strings usando . 
#Podriamos tambien generar una tercer variable $dna3 para concaternar las 2 anteriores:
$dna3= $dna1.$dna2;
# Imprimir las cadenas concatenadas
print $dna3;

#O podemos agregar al final de $dna1 el contenido de $dna2
$dna1 .= $dna2;
# Imprimir las cadenas concatenadas
print $dna1;

Repasemos el segundo tipo de elementos en Perl: arrays

La declaración se hace con el signo "@"

Por ejemplo:

@list= (“juan”,”jose”,”fred”); # es un array con 3 elementos. El primero está en la posición 0. 
print $list[0]; # ¿por qué uso $ y no @ para acceder al primer elemento?

@nucleotidos = ( ’a’ , ’c’ , ’g’ , ’t’ ) ;
print " Nucleotidos: @nucleotidos \n" ;

Hay funciones propias para arrays, por ejemplo, agregar un elemento al final:

push @list, “roberto”;
print $list[3];
print “@list \n”;

Quitar el primer elemento de la lista:

shift @list;
print “@list \n”;

Podemos ir guardando el elemento que remuevo en una nueva variable escalar:

$first = shift @list;

Lo mismo para el último, la función pop:

$last = pop @list;
print “@list \n”;

Una de las funciones más usadas para generar arrays es la función split sobre una cadena de caracteres. Recordar que el comando split tiene la sintaxis:

@values= split(/pattern/, $string)

Ejemplos:

#  DNA
$DNA = ’AAAAAAAAAAAATTTTTTTTTTTTTTT’;
@DNAarray = split(//, $DNA);
#que estaria haciendo este comando?
$base1 = $DNAarray[$position1];
print @DNAarray, "\n";

¿Que pattern estaría usando en este split?

Veamos el ejemplo de la clase:

$string= "Cell980.1 ATG Hypothetical 2.54 High";
@values =split(//, $string);

print $values[3],"\n";
($id, @values)=split(/\s/, $string);

print "$id\n";

Que contienen ahora $id y @values? Que pattern estaría usando en este split? Qué otros pattern se les ocurren que podemos usar? Entender la existencia de patrones en los archivos es una de las claves para el diseño de buenos scripts. La mayoria de los formatos de archivos en bioinformática están pensados de manera que sea sencillo manipularlos usando patterns. Recordar que vimos por ejemplo en los archivos FASTA el marcador “>” para indicar el comienzo del encabezado de una secuencias. Hay caracteres muy usados como por ejemplo “#”,”!”,”*” etc… Tambien palabras claves como veremos más adelante.

Otra función muy usada es la opuesta al "split", o sea “join”. La misma permite a partir de un array generar un string. Recordemos la sintaxis:

$string= join(“character(s)”,@list)

@list=("Cell980.1","ATG","Hypothetical","2.54","High");

$string=join("",@list);
$string2=join("||",@list);
$string3=join("*",@list);

print $string,"\n\n";
print $string2,"\n\n";
print $string3,"\n\n";

Revisemos cómo se ingresa información al script leyendo archivos. Primero debemos declarar un “filehandle”, un nombre donde alojaré el archivo que voy a leer:

open(MYHANDLE, “ejercicio.txt”)

Luego puedo ir leyendo las líneas. Recordar que en este caso, MYHANDLE será un array:

$line1=<MYHANDLE>;
$line2=<MYHANDLE>;

Esto se puede automatizar usando un bucle WHILE que irá leyendo línea a línea el archivo mientras exista la variable $line:

while ($line = <MYHANDLE>) {
print $line;
}
close MYHANDLE;

Una de las mayores fortalezas de Perl es su capacidad para parsear archivos (leer en un formato e imprimir en otro). Uno podría imprimir hacia el STOUT (Standard Output) como vimos en Linux, que es la pantalla o guardar en un archivo nuevo, ya sea desde dentro del script de Perl o guardando la salida por pantalla con el caracter “>”. Esto es más sencillo pero traerá inconvenientes al momento que querramos producir más de un output del mismo script.

Para generar el archivo de salida desde el mismo Perl, hay que tomar la precaución de abrirlo y especificar si el archivo será creado de nuevo “>” o si agregaré la información generaada al final de un archivo (si existiera) “>>”

open(MYOUTPUTHANDLE,”>somefile.txt”)
print  MYOUTPUTHANDLE “Hello there”;

open(MYOUTPUTHANDLE,”>>somefile.txt”)
print  MYOUTPUTHANDLE “Hello there”;

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

Download in other formats:

    Plain Text

Trac Powered

Powered by Trac 0.12.3
By Edgewall Software.

Visit the Trac open source project at
http://trac.edgewall.org/
