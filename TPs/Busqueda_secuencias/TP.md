# Búsqueda de secuencias por similitud

Objetivo: familiarizarse con el uso de programas de busqueda de secuencias en bases de datos, y en particular con el uso de estos programas en la línea de comando. 

Desarrollo del TP. Para realizar este TP tienen que estar frente a una terminal UNIX. Los programas que vamos a utilizar son: *blastall, blastcl3, formatdb y fastacmd (NCBI-Toolkit), fasta, tfasta, fastx, tfastx, fasty, tfasty, ssearch, prss* (**FASTA** program package). 

## BLAST intro

**BLAST** busca secuencias similares a una secuencia *'query'* en una base de datos de secuencias, utilizando distintas estrategias de búsqueda (dna vs dna, prot vs prot, dna vs prot, etc.).
**BLAST**, tal como es distribuído por el **NCBI**, se encuentra disponible mediante el comando *blastall*. Este comando necesita como mínimo tres argumentos para realizar una búsqueda:
* -i una secuencia query (recordar, i = input) 
* -d una base de datos con secuencias (recordar, d = database) 
* -p el tipo de busqueda (p = programa: *blastp*, *blastn*, *blastx*, etc.) 
Para ver una lista de los argumentos que acepta *blastall* prueben correr el comando sin argumentos. 
Como primer ejemplo podemos usar la secuencia *xlrhodop.pep* para realizar una búsqueda contra *Swissprot*. Como estamos trabajando con una secuencia y una base de datos de proteínas, usamos *blastp* para realizar la busqueda: 

```Bash
blastall -p blastp -i xlrhodop.pep -d Swissprot.fasta
``` 

**Si la base de datos no se encuentra en el directorio de trabajo ni en un lugar accesible al programa, hay que especificar el camino completo**

En este ejemplo, el resultado de la busqueda es volcado en la pantalla (stdout). Para que el resultado aparezca en un archivo, podemos redireccionar stdout (usando **>**, ver TP Unix) o usar la opcion -o (output)

```Bash
blastall -p blastp -i xlrhodop.pep -d Swissprot.fasta -o xlrhodop.blastp
``` 

Pueden ver el resultado del *blast*, por ejemplo paginando el archivo 

```Bash
less xlrhodop.blastp
```
**BLAST** tiene otras opciones interesantes, como:  
-G Para cambiar la penalizacion del gap de apertura.  
-E Para cambiar la penalizacion del gap de extencion.  
-W Para establecer el tamaño de la ktupla.  
-f Para indicar el umbral de extencion de alineamiento.  

Utilice distintas combinaciones de estos parametros y observe su impacto en las secuencias que son reportadas por **BLAST**

## FASTA intro
Al igual que **BLAST**, **FASTA** necesita los mismos tres argumentos obligatorios. Sin embargo, el paquete **FASTA** provee un comando ejecutable para cada tipo de búsqueda.
 
Comparison programs in the FASTA package

**FASTA** Compare a protein sequence to a protein sequence database or a DNA sequence to a DNA sequence database using the **FASTA** algorithm (*Pearson and Lipman, 1988, Pearson, 1996*). Search speed and selectivity are controlled with the ktup(wordsize) parameter. For protein comparisons, ktup=2 by default; ktup=1 is more sensitive but slower. For DNA comparisons, ktup=6 by default; ktup=3 or ktup=4 provides higher sensitivity; ktup=1 should be used for oligonucleotides (DNA query lengths < 20).

* **ssearch** Compare a protein sequence to a protein sequence database or a DNA sequence to a DNA sequence database using the Smith-Waterman algorithm (Smith and Waterman, 1981). ssearch3 is about 10-times slower than FASTA3, but is more sensitive for full-length protein sequence comparison.

* **fastx** Compare a DNA sequence to a protein sequence database, by fasty comparing the translated DNA sequence in three frames and allowing gaps and frameshifts. fastx uses a simpler, faster algorithm for alignments that allows frameshifts only between codons; fasty is slower but produces better alignments with poor quality sequences because frameshifts are allowed within codons.

* **tfastx** Compare a protein sequence to a DNA sequence database, calculating similarities with frameshifts to the forward and reverse orientations.

* **tfasta** Compare a protein sequence to a DNA sequence database, calculating similarities (without frameshifts) to the 3 forward and three reverse reading frames. tfastx and tfasty are preferred because they calculate similarity over frameshifts.

* **fastf** Compares an ordered peptide mixture, as would be obtained by Edman degredation of a CNBr cleavage of a protein, against a protein (fastf) or DNA (tfastf) database.

* **fasts** Compares set of short peptide fragments, as would be obtained from mass-spec. analysis of a protein, against a protein (fasts) or DNA (tfasts) database.


Ahora corramos la misma búsqueda del ejemplo anterior usando FASTA: 

```Bash
fasta xlrhodop.pep Swissprot.fasta > xlrhodop.fasta
```
 
# Diferencias entre BLAST y FASTA

* **ktup:** Tanto FASTA como BLAST usan una estrategia de búsqueda inicial basada en palabras cortas. ktup en FASTA es el parámetro que indica el tamaño de la palabra utilizada en esta búsqueda inicial. FASTA utiliza por default ktup=2, mientras que BLAST utiliza ktup=3. Sin embargo, FASTA sólo considera identidades respecto a la palabra, mientras que BLAST utiliza identidades y sustituciones conservativas. Por lo tanto BLAST con ktup=3 es en general más sensible que FASTA con ktup=2. FASTA con ktup=1 es más sensible, pero es también más lento. 
* **Matrices y scores:** BLAST y FASTA usan distintas matrices de scoring y gap penalties por default (BLAST: BLOSUM62, -12 first gap, -1 each additional gap; FASTA: BLOSUM50, -12 first gap, -2 each additional gap). 
* **Estadísticas** Los parámetros *kappa* y *lambda* son centrales para estimar scores en BLAST y en FASTA. FASTA calcula estos parámetros on the fly a partir de la base de datos. Esto produce estadísticas más representativas, pero puede ser problemático para bases de datos pequeñas. Si la base de datos es de menos de 10 secuencias, FASTA no estima estos parámetros. BLAST usa valores pre-calculados para estos parámetros, que fueron derivados a partir de simulaciones. 
* **Alineamientos:** BLAST puede mostrar varios alineamientos por cada par de secuencias (varios high-scoring pairs o HSPs), FASTA sólo muestra un alineamiento. 
* **Filtrado de secuencias de baja complejidad:** Por default, BLAST filtra secuencias de baja complejidad o repeticiones. FASTA no!. Esto puede afectar la capacidad de discriminar falsos positivos, aunque FASTA provee otro tipo de opciones para manejar este tipo de casos. Ver la sección específica sobre este punto más abajo. 
* **Traducciones:** *blastx* hace 6 búsquedas independientes (una en cada marco de lectura) mientras que *fastx3* y *fasty3* hacen una única búsqueda forward (o reverse usando -i) que permite frameshifts. Estos últimos son más sensibles y pueden producir mejores alineamientos que *blastx* cuando se usan secuencias de baja calidad. Lo mismo es cierto para *tblastn* vs *tfastx3* y *tfasty3*). 
* **Homólogos distantes:** Existe una opción en FASTA (-F) que les permite ignorar (i.e. que no aparezcan en el output) secuencias altamente similares al query. Esto es útil, por ejemplo, para focalizar una búsqueda en las secuencias más divergentes. No existe una opción similar en **BLAST**. 
* **Secuencias cortas:** Ya sea que busquen un primer o un péptido, si quieren utilizar BLAST o FASTA para esto, tengan en cuenta que BLAST es generalmente inútil al respecto. Esto es porque BLAST tiene un límite inferior sobre la longitud que puede tener una palabra (ktup). En el caso de nucleotidos, el límite inferior es 7 (el default es 11). En este sentido FASTA es mejor, porque siempre pueden usar ktup=1. Por otra parte, en el caso específico de péptidos, FASTA provee algunos algoritmos particulares de búsqueda (*fastf*, *fasts* y *tfasf*, *tfasts*).

>**Nota al margen:** usar un cuchillo en lugar de un destornillador, a veces puede funcionar; pero no deja de ser cierto que cada herramienta fue diseñada para un fin distinto. Si quieren realizar búsquedas de secuencias cortas prueben primero con *fuzznuc*, *fuzzpro* o *findpatterns* (todos parte de **EMBOSS**). 

## Filtros

Muchas secuencias son altamente repetitivas. Si la secuencia query contiene regiones de baja complejidad o repeticiones, es posible que una búsqueda encuentre muchas secuencias no relacionadas, con altos scores (por ej hits contra colas de poly-A o regiones ricas en Prolina).
En otros casos, la secuencia puede contener vector (plásmido) o repeticiones como Alu, que ustedes pueden querer omitir en la búsqueda. 
**BLAST** permite filtrar el primer tipo de casos, mediante la opción -F. 
**FASTA** en cambio no provee esta alternativa. Es el usuario el que tiene que filtrar el query antes de realizar una búsqueda. 

Ejercicio. usar la proteína Groucho de Drosophila (grou_drome) para buscar secuencias similares en *Swissprot* usando **BLAST**. Comparar los resultados obtenidos usando (-F T) o sin usar (-F F) la opción de filtrado que provee **BLAST**. 
Ahora para repetir el mismo ejercicio con **FASTA**, tenemos que detectar y marcar las regiones de baja complejidad. Para esto se utiliza *segmasker*: 

```Bash
segmasker -in grou_drome.fasta -outfmt fasta > grou_drome_lc.fasta
```

Comparen las secuencias *grou_drome.fasta* y *grou_drome_lc.fasta* e identifiquen las diferencias. Qué hizo *segmasker* con la secuencia? 
Ahora, podemos buscar secuencias similares en *Swissprot* usando *grou_drome.fasta* (con opciones standard) y *grou_drome_lc.fasta* (usando la opción *-S*). 

```Bash
fasta grou_drome.fasta Swissprot.fasta
fasta -S grou_drome_lc.fasta Swissprot.fasta
```

Qué diferencias encuentran en los histogramas de cada búsqueda? 

Para el segundo tipo de casos (vector, elementos repetitivos), es necesario detectarlos y enmascararlos (reemplazarlos por N o X) o marcarlos (con minúscula, por ejemplo, si toda la secuencia esta en mayúsculas) previo a la búsqueda. 
Ejercicio. la secuencia *est.fasta* contiene una región correspondiente al vector (plásmido). Esta secuencia fue enmascarada (reemplazada por X, *est_masked_X.fasta*) y marcada en minúsculas (*est_masked_lc.fasta*). Utilicen las tres secuencias para realizar una una búsqueda contra *Swissprot*, usando **BLAST** o **FASTA** (el que más les guste). Qué opciones tienen que usar en cada caso para evitar que en la lista de hits aparezcan beta-galactosidasas mencionadas y comparen los resultados. 

## Bases de datos propias

Tener acceso a **BLAST** o **FASTA** en la línea de comando les da la posibilidad de crear sus propias bases de datos para realizar búsquedas. 
**FASTA** puede realizar búsquedas sobre un archivo en formato *fasta* conteniendo varias secuencias sin ningún otro tipo de tratamiento. **BLAST**, sin embargo necesita contar con una base de datos indexada. *formatdb* es el comando que vamos a utilizar para generar los índices que **BLAST** necesita. 
En primer lugar, vamos a generar un archivo *fasta* múltiple con algunas secuencias. Por ejemplo para construir una base de datos con secuencias de opsinas podemos empezar con 

```Bash
seqret "Swissprot.fasta:ops*" fasta::ops
```
Esto debería generar un archivo FASTA múltiple conteniendo secuencias de opsinas. 

**Pregunta:** cuántas secuencias tiene nuestra base de datos? 
Ahora para indexar el archivo ops (en formato *fasta*), usamos *formatdb*, indicandole el archivo que contiene las secuencias (-i) y si el archivo contiene secuencias de ADN (-p F) o de proteínas (-p T). 

```Bash
formatdb -i ops -p T
```

Una vez indexada la base de datos, podemos hacer una búsqueda, por ejemplo, con nuestra ya conocida *xlrhodop.pep*

```Bash
blastall -p blastp -d ./ops -i xlrhodop.pep > xlrhodop.ops.blastp
```

Pueden ver las opciones que acepta el comando formatdb pidiendo ayuda: 

```Bash
formatdb --help
```


## BLAST con multiples secuencias
Si tienen un archivo multiple de secuencias en formato *fasta*, pueden usarlo como query en una búsqueda, usando **BLAST**. 
El archivo *opsv.fasta* contiene la secuencia de 4 fotorreceptores, usen este archivo para realizar una búsqueda, usando *blastp*, contra la base de datos ops que crearon en el ejercicio anterior. 
El output generado consiste en 4 reportes de **BLAST**, concatenados en un único archivo. Cómo pueden navegar fácilmente dentro del documento usando less? (Tip: qué palabras o conjunto de palabras ocurren una sola vez en cada reporte?) 
OK, puedo leer el reporte y manejarme bien dentro de él, ahora quiero partirlo en 4 reportes individuales, cómo hago? 
Para esto pueden usar el comando de unix split que puede partir un archivo en otros más pequeños, ya sea por tamaño o cada vez que encuentre una palabra o pattern (expresión regular). Usando la opción -p pueden especificar un pattern (Nota: la opción -p sólo está disponible en el comando split de sistemas operativos del tipo BSD (*FreeBSD*, *NetBSD*). Linux usa el comando *split* de GNU, donde esta opción no existe). 

```Bash
man split 
```

Tanto en Linux, como en cualquier Unix, una manera de partir un archivo en varios, usando un pattern es usando el comando *awk*. Dado un archivo llamado *blast.out*, podemos partirlo en varios usando la siguiente invocación: 

```Bash
awk --assign i=0 '/pattern/{i++}{print > "blast."i}' blast.out 
```
**Recuerden reemplazar "*pattern*" por el patron que quieren utilizar para dividir el archivo.**
