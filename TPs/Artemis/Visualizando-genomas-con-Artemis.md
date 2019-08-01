## 	Visualización de genomas usando Artemis

### Introducción:

Artemis es una herramienta de visualización y anotación de DNA gratuita desarrollada por Kim Rutherford ( Rutherford et al.,2000). Es utilizado rutinariamente para la anotación y el análisis de tanto genomas procariotas como eucariotas, y puede ser utilizado para visualizar datos mapeados de secuenciación de segunda generación. Este programa permite al usuario visualizar archivos de secuencias simples, archivos de EMBL/Genbank y los resultados de análisis de secuencias en un formato gráfico altamente interactivo e intuitivo. Multiples conjuntos/tipos de información pueden ser visualizados dentro de diferentes contextos, por ejemplo, en Artemis se puede inspeccionar motivos de secuencia de DNA, arquitecturas genicas locales (e.g. operones), varias kilobases de un genoma o hasta cromosomas enteros en una única pantalla. Se puede incluso realizar análisis dentro de Artemis guardando la salida para acceder luego.

### 	Objetivos:

El objetivo de este módulo es familiarizarse con las funciones básicas de Artemis empleando una serie de ejercicios. Estos ejemplos fueron desarrollados para atravesar las funciones más utilizadas. Sin embargo, les recomendamos que exploren otras funciones de Artemis que no estan desarrolladas en los ejercicios de este manual. Como siempre, "si no entienden, por favor pregunten!".

#### 	1. Inicializando Artemis

Para abrir el programa hagan doble click sobre el ícono de Artemis en el escritorio (también pueden arrancar Artemis desde la terminal tipeando 'art').

Aparecerá una pequeña ventana de inicio. Cargaremos la secuencia del cromosoma de Salmonella typhi, para esto clickeen en 'File' y luego 'Open'. Vayan a la carpeta "Module_1_Artemis" y abran el archivo "S_typhi.dna" seleccionandolo y luego clickeando en 'Open'. Si todo salió bien se les abrirá una ventana de Artemis. Si no fue así, pidan asistencia.

#### 	2. Cargando archivos de anotación (entries) en Artemis

Ahora cargaremos un archivo de anotación para el cromosoma de Salmonella typhi. Esto lo haremos clickeando en 'File' , 'Read An Entry' y seleccionando el archivo 'S_typhi.tab' y luego clickeando en 'Open'.

#### 	3. Vista básica de Artemis

Una vez realizado esto, démosle una mirada a que hay en la ventana ( de arriba hacia abajo):


1. Menúes desplegables. Después iremos viendo algunas de sus utilidades.
1. La siguiente línea muestra que entradas están activas. En nuestro caso estará S_typhi.dna y S_typhi.tab. Los detalles de los "features" que se encuentran actualmente seleccionados se muestran en el siguiente renglón.
1. Este es el panel principal de visualización. Las 2 lineas grises centrales representan la hebra de DNA positiva (arriba) y la negativa (abajo). Arriba y abajo de ellas se encuentran los 3 marcos de lectura en cada sentido respectivamente. Los codones stop en cada marco de lectura son señalados con barras negras verticales. Los genes y otros "features" (e.g. dominios Pfam o Prosite) se muestran como cajas coloreadas.
1. Este panel tiene una disposición similar al panel principal pero es un acercamiento que permite observar la secuencia de nucleotidos y de aminoacidos. Hagan doble click sobre un gen en el panel principal y en este observaran un acercamiento del comienzo del gen.Noten que ambos paneles pueden ser desplazados hacia la izquierda o la derecha con el deslizador horizontal ( inferior), y acercar o alejar con el deslizador vertical (lateral).
1. Este panel lista los "features" presentes, en el orden en que ocurren en el DNA, con el gen seleccionado resaltado.


#### 	4. Desplazandose a través de Artemis

Las 3 maneras principales de ir a región o posición que uno quiere en Artemis son: el menu desplegable Goto, el Navigator y el Feature Selector. El mejor método depende de lo que cada uno este tratando de realizar, conocer cual conviene utilizar en cada caso viene con la práctica.

##### 	4.1 El menu 'Goto'

Las funciones en este menu (ignoren el Navigator por ahora) son atajos para dirigirse a sitios dentro de "features" seleccionados o para saltar al final o principio de la secuencia de DNA. Son muy intuitivos, asi que pruebenlos!

Tareas sugeridas:


1. Alejen el visualizador, marquen una región grande de secuencia clickeando el botón izquierdo del mouse y arrastrando el cursor, luego vayan al principio y al final de la región seleccionada.
1. Seleccionen un gen, vayan al principio y al final.
1. Vayan al principio y al final de la secuencia del genoma.
1. Seleccionen un gen. Dentro de él, vayan a una base y/o aminoácido que quieran.
1. Marquen una región, luego desde el menu del click izquierdo, seleccionen 'Zoom to selection'.


##### 	4.2 Navigator

El panel del navigator es muy intuitivo, así que ábranlo (Clic en 'Goto', luego en 'Navigator') y pruébenlo!.

Sugerencias a donde ir:


1. Piensen un número entre 1 y 4809037 y vayan a esa base.
1. Su nombre de gen favorito ( puede que no este, en tal caso prueben 'fts').
1. Usen 'Goto Feature With This Qualifier Value' para buscar en todos los qualifiers por un término particular. Por ejemplo, usando la palabra 'pseudogene' te llevará al próximo "feature" que contenga esa palabra en cualquiera de sus qualifiers. Noten que repitiendo el clic en el botón 'Goto' los llevará a lo largo de los pseudogenes a medida que se presentan en el cromosoma.
1. Para la anotación de los genomas se utiliza un esquema de clasificación funcional mediante números, similar a los términos GO, denominados 'class qualifiers'( un ejemplo de esquema de clasificación funcional, pero diferente al utilizado para anotar este genoma, lo pueden encontrar en ​FunctionalClasificationScheme)[a]. A cada CDS se le asigna un 'class qualifier' de acuerdo a su función. Usen la función 'Goto Feature With This Qualifier value' para buscar CDS que pertenecen a una determinada clase. Algunos que pueden buscar son: 0.0.1 (Conservados en Escherichia coli) ; 1.4.0 (Respuestas protectivas) ; 1.4.1 (Muerte celular) ; 1.4.2 (Detoxificación) ; 1.4.4 ( sensitividad a la radiación) 3.1.0 (Biosintesis de aminoácidos) ; 3.1.01 (Biosíntesis de alanina) ; 3.1.09 (Biosíntesis de glicina).
1. Genes de tRNAs. Escriban 'tRNA' en el 'Goto Feature With This Key'
1. Secuencias consenso de DNA para la unión de reguladores ( reales o inventadas!). Noten que se pueden utilizar valores de bases degeneradas (e.g. R = A o G ; Y
1. Secuencias consenso de aminoácidos ( reales o inventadas!). Pueden utilizar 'X'. Noten que estas búsquedas se realizan en todos los marcos de lectura independientemente de si realmente codifican aminoácidos o no.


Claramente hay muchos más funciones de Artemis, las cuales no tendremos tiempo de explicar en detalle. Sin embargo ustedes mismos pueden recorrer los menús. Seguramente encuentren que la mayoría de ellos son intuitivos y simples de entender.

##### 	4.3 Feature Selector

Para acceder a este menú hay que ir a "Select" y luego a "Feature Selector ...". Al igual que con el Navigator, esto nos abre una nueva ventana donde podemos elegir los criterios de selección. Cada una de las opciones tiene una cajita asociada a su izquierda que nos permite usar o ignorar cada criterio, pudiéndose realizar cualquier combinación de los mismos.

- **Key**. Desde el menú desplegable se puede elegir que tipo de elemento queremos seleccionar (CDS, tRNA, TMM, etc.). Se lista una gran variedad independientemente si están o no anotados en nuestra secuencia.

- **Qualifier**. Nos permite refinar la búsqueda encontrando un texto determinado en el campo seleccionado (por ej. si elegimos EC_number podemos encontrar las regiones codificantes que pertenezcan a una categoría determinada como hicimos en "Navigator"). Debajo del campo para escribir el texto encontraran 3 cajas más que con opciones para la búsqueda del texto.

- **Up to/At least**. Aquí podemos restringir la búsqueda por cantidad de bases o exones que contiene la secuencia a seleccionar. No guarda mayores misterios.

- **Amino acid motif**. Por último, podemos buscar regiones que contengan ciertos patrones de aminoácidos y si su búsqueda debe llevarse a cabo en la hebra positiva, negativa o ambas.


Al finalizar la elección de criterios pueden apretar "Select" para seleccionar las regiones que cumplan con la búsqueda, o "View" para que nos dé una lista de los hits, con el mismo formato que la que encontramos bajo el panel principal.

#### 	Analizando información particular:

Por el método de su elección diríjanse a la región localizada entre las bases 2188349 y 2199512 en la secuencia de ADN. Esta región esta bordeada por el gen fbaB, el cual codifica la fructosa bisfosfonato aldolasa. Pueden utilizar el 'Navigator', el 'Feature Selector' o las funciones de 'Goto' discutidas previamente para ir a esta localización. Una vez que estén ahí visualizaremos la información específica disponible:

Anotación: Si clickean en un "feature" en particular pueden ver la anotación asociada a él: Seleccionen un "CDS feature" ( o cualquier otro "feature" y clickeen en el menú 'Edit' y seleccionen 'Selected Feature in Editor'. Aparecerá una ventana conteniendo toda la anotación asociada con este CDS.

Visualizando secuencias de aminoácidos: Clickeen en el menú 'View' y verán varias opciones para visualizar las bases o aminoácidos del "feature" que han seleccionado, en dos formatos, EMBL o FASTA. Esto puede ser muy útil cuando se desea utilizar otros programas que no están integrados en Artemis, e.g. aquellos disponibles en la Web que requieren cortar y pegar la secuencia en ellos.

Gráficos: Se pueden desplegar gráficos de características seleccionando un "CDS feature", luego clickeando en 'View' y 'Feature Plots'. La ventana que aparece muestra gráficos prediciendo hidrofobicidad, hidrofilicidad y alfa-hélices para la proteína codificada por el CDS seleccionado.

Visualizando los resultados de búsquedas en bases de datos: Hagan click en el menú 'View', luego seleccionen 'Search Results' y luego 'Fasta results'. Los resultados de la búsqueda aparecerán en una nueva ventana. Si clickean en el botón que se encuentra en el piso de esta ventana denominado 'send to browser', los resultados serán posteados en una ventana del buscador de internet. Dentro de esta ventana hay muchos links activos a fuentes externas de información como las entradas originales de bases de datos para todos aquellas que alinean con tu secuencia, como así también información disponible en PubMed, PFAM y muchos otros.

#### 	Analizando información global:

Además de visualizar al detalle los "features" anotados también se puede observar las características del ADN en toda la región presentada. Esto puede realizarse adicionando diferentes gráficos mostrando distintas características del ADN. Algunos de estos son utilizados para observar el potencial codificante o marcos de lectura dentro del ADN, como el 'GC frame plot', y otros pueden ser utilizados para buscar regiones de ADN adquirido horizontalmente. En el directorio de este módulo encontrarán una tabla de uso de codones, S_typhi.cod, la cual puede ser utilizada para generar un gráfico de uso de codones cargándola mediante la opción 'Add usage plots' dentro del menú 'Graph'.

Clickeen en el menú 'Graph' para ver todos los gráficos disponibles. Tal vez los gráficos más útiles sean 'GC content (%)' , 'GC Deviation' y 'Karlin Signature Difference' (es un gráfico de frecuencia de dinucleótidos). Despliéguenlos!. Para ajustar la suavidad de los gráficos pueden cambiar el tamaño de la ventana sobre la cual los puntos del gráfico son calculados, utilizando el deslizador vertical a la derecha de los mismos.

#### 	Nota:

La información de los gráficos es generada dinámicamente por Artemis y aunque este es un ejercicio relativamente rápido para una pequeña región de ADN, en una vista de genoma completo esto puede demorar un rato, así que, en tal caso,tengan paciencia.

Observen como los gráficos muestran una desviación marcada en la región que están visualizando. Para apreciar mejor la anomalía de esta región, agranden un poco la región visualizada. ¿Qué les sugiere el contenido inusual de nucleótidos en esta región del ADN?

Además de visualizar las características de regiones pequeñas del genoma, también se puede alejar la imagen y observar características del genoma como un todo. Para esto primero tengan en cuenta que alejar la imagen rápidamente con todos los "features" desplegados puede bloquear momentáneamente la computadora. Por lo que para realizar este proceso rápidamente, apaguen los indicadores de codones stop haciendo clic derecho sobre la ventana principal. Aparecerá un menú con la opción de deseleccionar los codones stop. También se debe eliminar temporariamente todo los "features" de anotación. Para realizarlo descliqueen la caja de "S_typhi.tab" en la barra de entrada debajo de la barra de menú.

Otro tip importante es ajustar la escala de los gráficos desplegados antes de alejar la imagen. Esto aumenta el tamaño de ventana sobre el cual un punto en cada gráfico es calculado. Para ajustar el escalado cliqueen con el botón derecho del mouse sobre la ventana de un gráfico en particular. Aparecerá un menú con una serie de valores para los tamaños máximos de ventana, seleccionen 20000. Esto deben hacerlo para cada gráfico desplegado.

Ahora están listos para alejar la imagen haciendo clic sobre el deslizador de la ventana principal y arrastrando hacia abajo.


