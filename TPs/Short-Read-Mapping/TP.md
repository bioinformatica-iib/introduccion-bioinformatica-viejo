### 	Short Read Mapping

Artemis le permite al usuario cargar, ver y editar archivos de EMBL/Genbank (NCBI) en un formato gráfico altamente interactivo. Artemis también permite ver datos de secuenciación de tecnologías de nueva generación de Illumina, 454 o Solid [NGS](https://www.sanger.ac.uk/science/tools/categories/Sequence%2520data%2520processing/all&sa=D&ust=1548712235814000) para más información y ejemplos. La re-secuenciación tiene como objetivo capturar información de polimorfismos de una base (SNPs), inserciones y deleciones (indels) y variaciones en el número de copias (CNVs) entre variantes del mismo organismo, dentro de una población. Para cumplir esto, en vez de ensamblar las lecturas de secuencia de novo para producir un nuevo genoma, se suelen mapear los nuevos datos de secuencia al genoma de referencia. De esta forma podemos luego identificar SNPs e INDELS que pueden distinguir dos organismos altamente relacionados. Hay que tener en cuenta que se asumen muchas cosas al realizar esto, incluyendo que el organismo de referencia y el analizado tienen la misma arquitectura genómica.

## Objetivos:

<div class="alert alert-dark">
<ol>
	<li>Mostrar como los datos de lectura de secuenciación de nueva generación pueden ser visualizados en Artemis junto a la secuencia de referencia escogida.</li>
	<li>Mostrar como se puede visualizar datos de variación genética en Artemis.</li>
</ol>
</div>

### Introducción al ejercicio:

*Chlamydia trachomatis* es uno de los patógenos humanos de mayor prevalencia en el mundo, causando una variedad de infecciones. Es la causa principal de enfermedades transmitidas sexualmente, se estima que solo en el año 1999 ocurrieron 91 millones de infecciones. Adicionalmente, es también la causa líder de infecciones de ceguera prevenibles con aproximadamente 84 millones de personas que tienen la enfermedad. Las cepas de transmisión sexual pueden ser subdivididas en aquellas que están restringidas al tracto intestinal y aquellos tipos más invasivos como la linfogranuloma venerea o LGV biovar. A pesar de las grandes diferencias en el sitio de infección y la severidad de la enfermedad hay pocas y pequeñas diferencias que distinguen cualquiera de las diferentes cepas de C. trachomatis, como verán a continuación, la mayoría de las variaciones ocurren al nivel de SNPs.

### El ejemplo:

Vamos a mapear las lecturas producidas con Illumina de una nueva variante de tracto genital aislada recientemente en Suecia, la cepa, conocida como NV, causó un alerta sanitario en Europa en el 2006. Durante este tiempo se ha convertido en la cepa dominante circulante en algunos países Europeos y comienza a desparramarse alrededor del mundo. La razón de la expansión de esta cepa fue que evade la detección por el test diagnóstico que está basado en una reacción de PCR. En el curso del ejercicio van a identificar la razón por la cual esta cepa evadió el ensayo diagnóstico estándar.

#### Flujo de trabajo de secuenciación y mapeo:

**Laboratorio húmedo**: El ADN de la cepa NV de C. trachomatis es roto en fragmentos (~200bp), mediante Illumina se secuencian entre 75-100 pares de bases de ambos extremos de cada fragmento generando lecturas pareadas ( del inglés "paired-end reads").

**_In silico_**: Se generan archivos de secuencia de cada lectura en un formato denominados "fastq", los cuales son alineados a la secuencia de referencia del genoma en formato SAM , luego se generan archivos en formato BAM, los cuales se pueden visualizar en Artemis.

#### Software de alineamiento de secuencias cortas:

Hay múltiples programas para mapear secuencias cortas, cada uno con sus fortalezas, debilidades y salvedades. Wikipedia tiene una buena lista y descripción de ellos. Busquen "Sequence alignment software" si están interesados. Nosotros utilizaremos el Burrows-Wheeler Aligner (BWA).

De la búsqueda en la pagina del programa [BWA](http://bio-bwa.sourceforge.net/&sa=D&ust=1548712235816000) se extrae lo siguiente:

> "El Burrows-Wheeler Aligner (BWA) es un programa eficiente que alinea secuencias de nucleótidos relativamente cortas contra secuencias largas de referencia como el genoma humano. Emplea dos algoritmos, bwa-short y bwa-sw. El primero se emplea para secuencias menores a 200 pb y el segundo para secuencias más largas de hasta 10kpb. Ambos algoritmos realizan alineamientos gapeados. Son frecuentemente más precisos y rápidos con lecturas con bajas tasas de error."

A pesar de que BWA no identifica SNPs como otros programas de alineamientos de secuencias cortas, e.g. MAQ, es más preciso en el alineamiento y su formato de salida (SAM), es aceptado por varios identificadores genéricos de SNPs como samtools y GATK.

BWA tiene un manual que explica muchos más detalles de los comandos que vamos a utilizar. Estos pueden ser encontrados aquí: [Tutorial-BWA](ttp://bio-bwa.sourceforge.net/bwa.shtml&sa=D&ust=1548712235817000)

Li H. and Durbin R. (2009) Fast and accurate short read alignment with Burrows-Wheeler Transform. Bioinformatics, 25:1754-60. [PMID: 194511688]

Lo primero que vamos a hacer en este módulo es mapear o alinear lecturas de secuencias crudas que están en un formato estándar de lecturas cortas, denominado fastq, contra un genoma de referencia. Esto nos permitirá determinar las diferencias entre nuestra cepa y la cepa de referencia sin tener que ensamblar de novo nuestros nuevos datos de secuencia.

En la siguiente imagen se muestra las características del formato fastq:

		
	@IL7_1788:5:1:34:600/1
	GATTTGGGGTTCAAAGCAGTATCGATCAAATAGTAAATCCATTTGTTCAACTCACAGTTT
	+
	>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>><<<<6666662666666664664 
	
Cada lectura de secuencia está representada por cuatro lineas.

- 1ra línea. `IL7_1788:5:1:34:600/1` es el nombre de la lectura secuenciada donde los números de interés incluidos son: `IL7` el cual hace referencia a la máquina de secuenciación. `1788` y `5` indican la corrida y la línea de lectura. `/1` hace referencia a que es una lectura directa, en caso de ser reversa habría un `/2`.
- 2da línea. La secuencia.
- 3ra línea. `+` Separador entre la secuencia y la calidad.
- 4ta línea. Calidad de la secuencia. Hay un caracter para cada nucleótido. El caracter está asociado a un puntaje de calidad de cada nucleótido, lo cual está codificado de la siguiente forma: cada caracter representa un número (N°) según el código decimal [​ASCII](http://www.elcodigoascii.com.ar/&sa=D&ust=1548712235819000), y la calidad se define cómo este número menos 33. ¿Y cómo se asocia esto a la probabilidad de error (p) de la base asignada? así: `(N° - 33) = cálidad`

> Calculen la probabilidad de error (p) de las bases con caracteres de calidad '>' y '6'. ¿Coincide con la premisa de que las lecturas de secuencia tienden a tener más errores al final que al principio?.

### Ejercicio

Para comenzar el ejercicio necesitamos abrir una terminal y movernos hacia el directorio del TP de "ACT".

Para mapear las lecturas usando BWA, sigan la siguiente serie de comandos:

**Paso 1:** Nuestra secuencia de referencia para este ejercicio es de la cepa Chlamydia trachomatis LGV, denominada L2. El archivo de secuencia contra el cual van a alinear las lecturas se denomina "L2_cat.fasta". Este archivo contiene concatenado en formato FastA la secuencia del genoma y del plásmido.

La mayoría de los programas necesitan indexar la secuencia referencia contra la que se alinearan las lecturas antes de comenzar. Para hacer esto para BWA, escriban:

 
	bwa index L2_cat.fasta 


Sean pacientes y esperen a que vuelva a aparecer el prompt antes de continuar.

**Paso 2:** Ahora alinearemos las lecturas directas y reversas separadamente contra nuestra nueva secuencia de referencia indexada y salvaremos la salida en archivos "F.sai" y "R.sai" respectivamente. Realicen esto usando los siguientes dos comandos:



	bwa aln -q 15 L2_cat.fasta NV_1.fastq > F.sai  
	bwa aln -q 15 L2_cat.fasta NV_2.fastq > R.sai  


Ambos comandos se tomarán un poco de tiempo ya que son muchas las lecturas a alinear.

> ##### Nota:
> El 'flag' "`-q 15`" le dice al programa el puntaje mínimo de calidad de secuencia que será aceptado. Lecturas de baja calidad no serán alineadas.

**Paso 3:** Ahora queremos mezclar los dos alineamientos; lecturas directas y reversas. El comando que utilizaran es:


	bwa sampe L2_cat.fasta F.sai R.sai NV_1.fastq NV_2.fastq > mapping.sam  

> ##### Nota:
>'sample' es para lecturas apareadas. 'mapping.sam' determina el nombre del archivo de salida que sera creado en formato SAM. El formato SAM ( Sequence Alignment Map) es un formato genérico para guardar grandes cantidades de secuencias de nucleótidos alineadas. Crear nuestra salida en formato SAM nos permite utilizar un paquete de software complementario denominado "Samtools".

Samtools provee varias utilidades para manipular alineamientos en el formato SAM. Vean [​Samtools](http://samtools.sourceforge.net/&sa=D&ust=1548712235822000).

Hay una gran cantidad de opciones para cambiar la manera en que el programa corre, algunas explicaremos, otras no. Si lo desean, para tener una explicación de estas opciones o "flags" , escriban 'samtools' y un comando, por ejemplo 'view' o 'index', y presionen enter. Obtendrán una explicación detallada de todas las opciones de cada comando.

Ahora necesitamos cambiar el formato del archivo de SAM a BAM. A pesar de que el formato SAM es muy útil para alineamientos de lecturas de secuencias a una secuencia de referencia, es un poco lento para analizar datos en una computadora. BAM es el equivalente binario de SAM y fue desarrollado para aumentar la velocidad y utilizarse en procesamientos intensivos de datos.

**Paso 4:** Para convertir nuestro alineamiento en formato SAM a formato BAM:

	samtools view -b -S mapping.sam > mapping.bam 

> la opción '-b' indica que la salida debe ser en formato BAM y la opción '-S' indica que la entrada es en formato SAM

**Paso 5:** Seguidamente necesitamos ordenar las lecturas de secuencia mapeadas en el archivo BAM, esto lo haremos con el siguiente comando:

	samtools sort mapping.bam NV 

> 'NV' indica el prefijo para el archivo de salida

**Paso 6:** Finalmente tenemos que indexar el archivo en formato BAM para que este listo para ser visualizado en Artemis:

	samtools index NV.bam

Estamos listos para abrir el Artemis y visualizar nuestros nuevos datos de secuencias mapeados.

1. Inicien Artemis. Abran la secuencia de referencia "L2_cat.fasta". ¿ Que indican los dos "features" que aparecen?"
1. Ahora carguen el archivo de anotación denominado "L2_cat.embl" , para esto hagan click en 'File', 'Read an Entry' y abran el archivo que esta en la carpeta que lleva ese nombre en la carpeta del TP

Para examinar el mapeo de lecturas que acabamos de hacer vamos a cargar a Artemis nuestras lecturas mapeadas en formato BAM, de la siguiente manera: Hagan clic en 'File' , 'Read BAM / VCF ' 'Select' y abran el archivo NV.bam

En poco tiempo deberían ver aparecer la ventana BAM en la pantalla de Artemis. Recuerden que estas lecturas son de la cepa sueca "NV" mapeadas contra el genoma de referencia de la cepa L2. Esta visualización se denomina apilada o "stack view". Cada linea representa una lectura de secuencia. Notar que algunas lecturas estan coloreadas en azul y otras en verdes, las azules son lecturas únicas, mientras que las verdes representan lecturas duplicadas que tienen el mismo comienzo y fin. Para ahorrar espacio si hay secuencias duplicadas, solo se muestra una. Esto significa que podrían haber una gran cantidad de lecturas duplicadas en el mismo punto, pero solo se verá una representada.

Si cliquean una lectura, también se seleccionará la lectura apareada. También notarán que si el cursor se detiene por suficiente tiempo sobre una lectura aparecerán los detalles de esa lectura en una pequeña caja. Si quieren saber más sobre una lectura, hagan clic derecho sobre ella y seleccionen en el menú: 'Show details of: READ NAME' . Aparecerá una ventana detallando la calidad del mapeo, coordenadas, si es una lectura duplicada o no, etc. Si esta lectura se encontrase en una región interesante, poder acceder facilmente a esta información puede ser muy valioso.

"Mapping quality"- El máximo valor posible es 99. La calidad de mapeo depende en la precisión de la lectura y el número de "mismatches" con la referencia. Un valor de 0 indica que la lectura mapea igualmente bien con al menos otro lugar por lo que su mapeo no es confiable.

Se pueden utilizar varios de estos descripciones en las lecturas mapeadas para filtrar las lecturas que se muestran en la ventana. Para realizar esto hagan clic derecho sobre el gráfico de lecturas apiladas , seleccionen 'Filter'. Aparecerá una ventana con muchas opciones para filtrar: 'By Mapping Quality (mapq) cut-off' --> Lecturas con calidad de mapeo menor a este valor no se muestran. Prueben con 59.

Pongan `HIDE` en `Proper pair` , ¿qué sucede?

> ##### Tip: 
> Filtrar lecturas con regiones repetitivas y ver únicamente lecturas correctamente apareadas puede ser muy útil para hacer el análisis del mapeo.

#### Visualización de las lecturas mapeadas

Anteriormente mencionamos que, para ahorrar espacio, si hubiesen lecturas duplicadas solo se representa una. Pero tal vez ustedes deseen saber la cobertura total en una región particular o simplemente quieran ver un gráfico de cobertura por otras razones. Pueden hacer esto agregando gráficos adicionales. Hagan clic derecho en el gráfico de lecturas apiladas, luego seleccionen 'Graphs' y 'Coverage' Nota: Tal vez tengan que reajustar el tamaño de los paneles para ver ambas visualizaciones a la vez.

Hay otras maneras de visualizar la información de las lecturas alineadas. Cada una puede ser sutilmente diferente, pero son muy ùtiles para tareas específicas como (espero) veran luego. Para explorar las vistas alternativas de las lecturas hagan clic derecho en el panel BAM y seleccionen el menú de opciones 'Views': a) Ya hemos visto la 'stack'. b) La vista 'coverage'. Como se puede agregar el gráfico de cobertura debajo, también se puede convertir la vista apilada en vista de cobertura. Esta vista puede ser útil cuando multiples archivos BAM son cargados y un gráfico separado se muestra para cada uno. c) La vista 'Strand stack', muestra las lecturas directas y reversas separadas por encima y por debajo de la escala respectivamente. Muy útil para aplicaciones hebra específicas. d) La vista 'Paired stack' une lecturas apareadas. Esto puede ser útil para visualizar rearreglos y para confirmar que regiones cercanas en el genoma de referencia también lo estan en el genoma del cual emanan las lecturas alineadas. e) La vista 'Infered size' grafíca las lecturas apareadas a lo largo del eje Y de acuerdo al tamaño de inserto inferido del fragmento de DNA utilizado para hacer la libreria. Noten que las librerias de Illumina son usualmente hechas de DNA fraccionado con un tamaño promedio de 250bp. Este no es el tamaño real de los fragmentos de la libreria, sin embargo uno esparía que correlacionen y que sean relativamente constante si la referencia esta altamente conservada con la secuencia mapeada. La utilidad de esto parece un poco oscura pero no lo es y puede ser utilizada para ver inserciones y deleciones, como veremos a continuación.

Es difícil ver la utilidad de algunas de estas funciones sin buenos ejemplos biológicos. Así que para ver uno, diríjanse, como deseen, hacia el final de la secuencia o a la posición 1043000. Ajusten la vista de tal forma que puedan ver la ventana de lecturas apiladas y el gráfico de cobertura. Noten dos cosas:

1. La profundidad de la cobertura se incrementa al comienzo del "DNA feature" indicado con una línea marrón.
2. La cobertura cae a cero dentro de una región de este "DNA feature".

¿A que se puede deber?

La respuesta al primer interrogante es que la secuencia que esta visualizando es un plásmido ( el "DNA feature" en marrón), el cual esta presente en múltiples copias por célula. El cromosoma sólo esta presente en una copia por célula ("DNA feature" naranja), por lo cual cada región del plásmido es secuenciada más seguido que cada parte del resto del genoma. Pero, ¿que sucede con la región en el plásmido en donde no se mapea ninguna lectura?

Aquí es donde la vista de tamaño inferido ('inferred size view') es realmente útil. Cambien la vista, como antes, a 'inferred size' y usen la escala logarítmica ( esto lo realizan chequeando la caja 'Use log Scale' en en el mismo menú que abren para cambiar las vistas de las lecturas mapeadas). Nuevamente ajusten el tamaño de las ventanas para ver las lecturas sobre la región que nos interesa. Lo que observarán es que el tamaño inferido de las lecturas pareadas a los lados de esta zona es mucho mayor al tamaño normal observado por fuera de esta región. No observándose ninguna línea gris uniendo lecturas pareadas dentro del rango normal de tamaño cruzando esta región. Esto es indicativo de una deleción en la cepa secuenciada comparada con la referencia.

> ¿Ya intuyen porque esta cepa no era detectada en el ensayo diagnóstico estándar?

#### Visualización de múltiples archivos BAM

También pueden visualizar múltiples archivos BAM al mismo tiempo. Recuerden que los archivos BAM son un grupo procesado de lecturas alineadas de una bacteria ( en este caso) contra una secuencia de referencia. Asi que en principio podriamos observar múltiples aislados bacterianos diferentes mapeados contra la misma referencia. La cepa que de C.trachomatis que van a leer es la L2b. Es filogenéticamente más cercana a la cepa de referencia que la que hemos analizado hasta el momento, por eso el nombre similar.

No harán nuevamente el mapeo para esta cepa, ya hemos procesado los datos crudos en fastq por ustedes. El archivo que necesitan se denomina "L2b.bam". Para abrirlo hagan clic derecho sobre la vista de las lecturas apiladas y luego en el menú 'Add Bam...', 'Select' y en la carpeta "Module_3_Mapping" encontraran el archivo.

Lo primero que hace Artemis es unir todas las lecturas nuevas a las anteriores en la misma ventana. Esto es útil si se realizaron múltiples corridas de secuenciación a partir de la misma cepa. Pero en este caso queremos separarlas en dos ventanas para verlas independientemente. Para esto lo que haremos es primero clonar la ventana de lecturas apiladas actual haciendo clic derecho sobre la misma y seleccionando 'Clone window'. Ahora tendrán dos ventanas idénticas con todas las lecturas apiladas. Si ahora hacen clic derecho sobre la ventana superior y seleccionan 'Bam files' pueden prender o apagar los archivos BAM. Lo que significa que pueden desplegar cada archivo BAM por separado en las dos ventanas prendiendo alternativamente uno y apagando el otro.

Esten donde esten en el genoma, vayan nuevamente a la región del plásmido que está situada al final del genoma y observen la región no mapeada previamente (alrededor de la base 1044800). Pueden ver que el nuevo archivo BAM para la cepa L2b no muestra la deleción, mostrando lecturas cubriendo esta región. Miren la vista de 'Inferred size' también para comparar ( puede que se enlentezcan los desplazamientos, tengan paciencia).

#### Visualización de SNPs

Para comenzar, regresen a la visualización de lecturas apiladas.

Para visualizar SNPs hagan clic derecho en la ventana donde estan las lecturas apiladas. Luego en el menú que se despliega, hagan clic en 'Show' y chequeen la caja que dice 'SNP marks'. Se mostrarán los SNPs contra la referencia como líneas rojas en las lecturas individuales. Observarán que algunos SNPs están presentes en todas las lecturas, formando líneas verticales rojas, mientras que otros SNPs se encuentran distribuidos más esporádicamente. Los primeros son con mayor probabilidad verdaderos SNPs mientras que los últimos más probablemente sean errores de secuencia. Pero claramente esa no es una verdad universal. Si acercan la visualización de las lecturas apiladas al máximo podrán observar las secuencias individuales de cada lectura y las bases que difieren de la referencia estarán en rojo.

> ##### Nota:
> Muchos SNPs son bastante claros, sin embargo, esto no es siempre el caso. ¿Qué sucede si la profundidad de lecturas es muy baja? Si solo hay dos lecturas mapeando en un sector, la referencia es T y ambas lecturas son C, ¿Es evidencia suficiente para decir que hay un SNP? ¿Que pasa si hay muchas lecturas mapeando una región y, por ejemplo, de 100, 50 tienen G y las otras 50 tienen T en una posición en particular. ¿Es un SNP? También podria ser una coinfección o una variación en un genoma diploide...

#### Mirando con más detalle los SNPs:

Hasta el momento hemos visto la variación como un simple y homogéneo grupo de SNPs. En realidad necesitarías más información para entender el efecto que el cambio en la secuencia puede ocasionar en, por ejemplo, la capacidad codificante. Para esto podemos visualizar un tipo de formato diferente denominado "variant call format" (VCF). Hay una forma adicional comprimida de esto denominada "binary variant call format" (BCF) el cual es el que utilizaremos, y para los propósitos del curso VCF y BCF pueden ser utilizados indistintamente.

El formato VCF fue desarrollada para representar datos de variación de 1000 proyectos genoma humanos y será probablemente aceptado como formato estandar para este tipo de datos.

Nosotros vamos a generar el archivo en formato BCF a partir de nuestro archivo NV.bam y visualizarlo en Artemis.

Para crear un archivo BCF necesitan ir al a terminal y escribir los siguientes comandos:


	samtools mpileup -DSugBf L2_cat.fasta NV.bam > NV_sorted.bcf


Para poder visualizar los SNPs necesitan correr además los siguientes dos comandos:


	bcftools view -bcg NV_sorted.bcf > NV.bcf  


Como antes para ver este archivo en Artemis es necesario indexar el archivo de salida:

	bcftools index NV.bcf 


#### LIMPIEZA:

Antes de ver estos datos en la sesión de Artemis abierta necesitamos hacer un poco de limpieza en la carpeta. Muchos de los archivos que hemos creado son muy grandes y ya no son requeridos. Asi que en la terminal eliminen los archivos innecesarios con el siguiente comando:


	rm L2_cat.fasta.amb L2_cat.fasta.ann L2_cat.fasta.bwt L2_cat.fasta.pac L2_cat.fasta.rbwt L2_cat.fasta.rpac L2_cat.fasta.rsa L2_cat.fasta.sa L2_cat.fasta.fai NV_sorted.bcf F.sai R.sai mapping.sam mapping.bam 


Para ver una región con algo de variación genética interesante vayan al gen CTL0578, (otra vez, usen el deslizador, el menú 'GoTo' o el 'Navigador')

Ahora leeremos en Artemis el archivo BCF que recien crearon. Para esto diríjanse al menú principal, seleccionen 'File' , 'Read BAM / VCF' , 'Select...' y abran el archivo "NV.bcf" Como siempre ajusten el tamaño de las ventanas BAM y BCF para poder visualizarlas bien. Abran notado que, en un principio, en la ventana BCF solo se muestran los SNPs del cromosoma. Para mostrar los SNPs del plásmido abran el ícono que se encuentra arriba y a la izquierda en el panel de BCF y seleccionen 'Combine References'. Ahora ambos serán visibles.

Aquí abajo se lista el esquema de colores utilizado para las variantes en el panel de BCF. Noten que a su vez se incluyen los indels. Muevanse a lo largo de la secuencia y encuentren busquen algunas delas variantes.

#### Esquema de colores por defecto
<div class="alert alert-light">
<table>
	<thead>
		<th> Variante </th>
		<th> Identificador </th>
	<thead>
	<tr>
		<td>Variante A</td>
		<td>Verde</td>
	</tr>
	<tr>
		<td>Variante G</td>
		<td>Azúl</td>
	</tr>
	<tr>
		<td>Variante T</td>
		<td>Negro</td>
	</tr>
	<tr>
		<td>Variante C</td>
		<td>Rojo</td>
	</tr>
	<tr>
		<td>Alelos múltiples</td>
		<td>Naranja, con un círculo en la punta</td>
	</tr>
	<tr>
		<td>Inserciones</td>
		<td>Magenta</td>
	</tr>
	<tr>
		<td>Deleciones</td>
		<td>Gris</td>
	</tr>
	<tr>
		<td>Sin variación</td>
		<td>Gris claro</td>
	</tr>
	<tr>
		<td>SNP sinónimo</td>
		<td>Rojo</td>
	</tr>
	<tr>
		<td>SNP no sinónimo</td>
		<td>Azul</td>
	</tr>									
</table>
</div>

### Puntuación de calidad

Las variantes están todas en la escala del rojo, siendo aquellas con mayor puntaje de color más intenso.

Se pueden leer múltiples archivos BCF de muchos aislamientos distintos. Para hacer esto hagan clic derecho sobre la ventana BCF y seleccionen 'Add VCF' ( recuerden que BCF y VCF son esencialmente la misma cosa). Ya hemos generado un archivo BCF para la cepa L2b, están en el directorio llamado "BCF" que se encuentra dentro de la carpeta de este módulo ( "Module_3_mapping"). Una vez que hayan abierto el archivo y para facilitar la identificación de cada archivo BCF activo, hagan clic derecho en la ventana BCF y chequeen la caja 'Show labels' . Verán los etiquetas a la izquierda de la ventana. Lo primero que deberían notar es que L2b tiene bastante menor cantidad de SNPs e indels que NV , comparado a la referencia. Esto es porque, como mencionamos anteriormente, L2b es un cepa de mayor cercanía filogenética a la de referencia.

Como deben imaginarse, Artemis también permite filtrar los archivos BCF. Haciendo clic derecho sobre el panel y seleccionando 'Filter...' podrán ver las opciones de filtrado. Pueden seleccionar o deseleccionar diferentes tipos de variantes de SNPs para modificar la vista. Los sitios 'Non-Variants' ( no variantes) son importantes porque diferencian aquellos sitios que no cambian pero tienen lecturas que mapean sobre esas posiciones, de regiones que aparentan no tener variaciones porque no hay lecturas que mapean a ellas. Piensenlo.

Como la vista de archivos BAM, también pueden remover o incluir SNPs basado en, por ejemplo, el puntaje del mapeo, la profundidad de cobertura, la calidad de secuencia. Todo esto lo pueden hacer desde la sección PROPERTY del menú de filtrado de SNPs. Valores de corte útiles son de un "DP" de "10" y de un "Qual" de al menos "30".