## TP Integrador de Introducción a la Bioinformática

Este es un **trabajo práctico integrador** en el que deberán aplicar todos los conocomientos y herramientas adquiridas durante de la cursada a un problema puntual. La finalidad de este trabajo es evaluar la capacidad técnica para producir resultados, así como también su criterio a la hora de evaluar el significado biológico de los mismos.

### Modalidad 

El trabajo deberá ser entregado en forma escrita (como un informe de laboratorio), y en formato digital. Para aprobar deberá cumplir con AL MENOS las consignas propuestas (debidamente señaladas). Esto significa que pueden extender el análisis cuanto gusten. ¡Sean creativos! El trabajo deberá ser realizado con la misma persona con la que realiza los TPs normalmente. 

Dado que es un TP para hacer en casa, apelaremos a su buena voluntad y honestidad profesional... de todos modos, cabe advertir que **cualquier atisbo de plagio será severamente sancionado, equivalente al de copiarse en un examen**. 

> Nota: no subestimen la capacidad de un (bio)informático para hallar *atisbos* de plagio. 

### Consultas

Pueden consultar en cualquier momento acerca de las herramientas necesarias o sobre la interpretación de los resultados provistos. Los docentes se reservan el derecho a no resolver la pregunta si consideran que deberían saber la respuesta. 

### Datasets

Cada uno de ustedes tendrá datasets separados para trabajar, de modo que esperaremos ver resultados diferentes en cada caso, con algunas similitudes conceptuales. 


| Nombre                     | Dataset | País / Región   |
|----------------------------|---------|-----------------|
| Lucas Perrone              | DE.csv  | Alemania        |
| Ramiro Quinteros           | DE2.csv | Alemania        |
| Aldana Moyano              | AU.csv  | Australia       |
| Carola Campanelli          | CH.csv  | China           |
| Iael Kaplan                | CH2.csv | China           |
| German Ignacio Molina      | CH3.csv | China           |
| Melina Arena               | CH4.csv | China           |
| Mercedes Florencia Vautier | ES.csv  | España          |
| Sara Lencina               | ES2.csv | España          |
| Laura Serantes             | US.csv  | Estados Unidos  |
| Melina Serassio            | US2.csv | Estados Unidos  |
| Abril San Martín           | US3.csv | Estados Unidos  |
| Analía Etcheverrito        | US4.csv | Estados Unidos  |
| Jerónimo Batista Bucher    | GR.csv  | Grecia          |
| Valentino Mórtola          | GR2.csv | Grecia          |
| Tomás Zucchini             | GR3.csv | Grecia          |
| Emilia Batista Bucher      | HK.csv  | Hong Kong       |
| Milagros Albornoz          | HK2.csv | Hong Kong       |
| Emiliano Huang Luna        | NT.csv  | Paises Bajos    |
| Facundo Nicolás Pauluk     | PO.csv  | Polonia         |
| Lautaro Maceira            | CZ.csv  | República Checa |
| Nehuen Fesser              | CZ2.csv | República Checa |
| Julieta Seifert            | TH.csv  | Tailandia       |

### Consideraciones generales

**Fecha de entrega:** 24/06 (o antes)

- En todos los casos en los que utilicen algoritmos que requieran parámetros, indíquenlos debidamente y justifiquen su elección si lo consideran necesario.
- Agreguen a su reporte todos los resultados (figuras o texto) que consideren necesarios. Puede ser una *fotito*/*snapshot* de lo que aparece en pantalla, o pueden ponerlo en un archivo aparte (si el resultado fuera muy largo) y referenciarlo desde el texto.
- Tendrán que leer e investigar acerca de el o los virus relacionados para dar sentido biológico a los resultados. Esto significa que no les va a alcanzar con lo que vimos/hicimos para hacer un buen TP. *Sorry, not sorry*.

### Propuesta

Usted trabaja en un laboratorio que tiene a su cargo la vigilancia  epidemiológica nacional de varios agentes infecciosos (revise la tabla de datasets para hallar qué país le tocó). Como parte del mismo, todos los días se obtienen clones y secuencias de nuevos aislamientos. Su jefe lo pone a cargo de analizar varios, cuya secuencia ya ha puesto en el dominio público, para extraer toda la información bioinformática posible de su colección de datos. 

- Los _accession numbers_ correspondientes a los aislamientos designados (`PAIS.csv`)
- El _accession number_ de la secuencia  de referencia de SARS-CoV-2 (`RefSeq.csv`)

Su jefe quiere contestar algunas preguntas mínimas (aunque puede extender su análisis todo lo que quiera).

#### Tareas mínimas a realizar:

- **Búsqueda de secuencias**: Obtenga las secuencias genómicas de los aislamientos que le pasó su jefe. 
- **Alineamiento de a pares**: Realice un alineamiento entre la secuencia de referencia y una secuencia al azar entre las que acaba de descargar. 
- **Marcos abiertos de lectura**: Obtenga las secuencias correspondientes a la proteína N de todos los aislamientos y construya una fasta múltiple con ellas 
- **Desorden intrínseco**: Evalúe el desorden intrénseco de las proteínas `N`, `S` y `ORF1ab` (elija una aislamiento al azar). ¿Qué patrones de desorden encuentra?¿Qué correlato podrían tener los dominios desesctructurados hallados con la función biológica de la proteína?
- **Construcción de un un alineamiento múltiple**: Genere un alineamiento múltiple de a partir de un fasta múltiple conteniendo la proteína E y, con éste:
  - **Construcción de una PSSM o un HMM**: Realice un alineamiento múltiple de la proteína E. Construya una PSSM o un HHM. 
  - **Construcción de un árbol filogenético**: Construya un árbol filogenético utilizando cualquier estrategia que considere apropiada (justifique su elección). 

A partir de sus experimentos, conteste las siguientes preguntas:

1. ¿Todos los aislamientos en su región fueron identificados como SARS-CoV-2?
2. ¿Halló diferencias significativas entre la secuencia de referencia y alguno de sus aislamientos? ¿En caso afirmativo, con cuál? ¿Ese aislamiento fue identficado como SARS-CoV-2?
3. ¿Qué opina de los patrones de conservación/variabilidad del virus?¿Hay regiones más conservadas qué otras?¿Qué puede decir de ellas?
4. ¿Qué puede decir de la distribución filogenética de sus aislamientos?

#### Extras para entusiastas

##### Ejercicio de *parseo* de datos

Su jefe le ha encargado la utilización predictores para hallar dominios funcionales y ontologías (PFAM, Gene Ontologies, InterPro, etc) en todo el genoma de referencia. Le pide que reporte sus resultados en formato de tabla, a partir del archivo `anotaciones.list`

| Proteina | Anotación |
| --- | ----------- |
| Proteina 1 | anotacion 1 |
| Proteina 2| anotacion 2 |
| Proteina 3| anotacion x |
| ... | ... |

NOTA: Entregue el/los scripts que utilizó para generar la tabla.

##### Ejercicio de visualización y anotación

Visualice su aislamiento más divergente con el genoma de refencia usando genómica comparativa. Describa qué regiones se encuentran conservadas y cuáles no. Anote los marcos abiertos de lectura utilizando al genoma de referencia como molde. 

##### Ejercicio de short-read mapping y variant calling

Un colaborador ha observado, en esayos fenotípicos, que ciertas lineas celulares presentan resistencia a la infección viral. El mecanismo de resistencia es, a priori, desconocido. Lo único notable es que las células presentan muy baja tasa de infección (incluso a altas multiplicidad de infección). Su director ha obtenido lecturas cortas de secuenciación Illumina (*paired end*) del genoma de dicha linea celular, y ha hecho un sorteo entre todos sus becarios para repartir los cromosomas a estudiar. A usted le ha tocado un fragmento del cromosoma X. 

- [Lecturas *forward*]()
- [Lecturas *reverse*]()

Realice el mapeo de dichas lecturas al genoma de referencia (`X-fragment.fasta`, secuencia; `X-fragment.gb`, anotaciones) y evalúe si existen mutaciones con potencial para conferir resistencia al virus (si la/s halla, hipotetice el motivo por el cual dicha/s mutación/es funciona brindando resistencia a la linea celular). 

Usted ya hizo esto alguna vez en su vida, por lo que ya tiene script escrito `seqprep.sh`. Actualice dicho script con la secuencia de interés y explique qué hace cada comando (Utilice comentarios "#" adentro del script). Deberá entregar el script conjuntamente con su informe.

Luego de correr el script debería tener algo así (no hace falta que lo corran: el link de abajo es el resultado que obtendrían)
- [mapping-sorted.bam]()

¿Encontró algo interesante?

##### Ejercicio de programación y data mining

Finalmente, para corroborar las observaciones de los ejercicios anteriores, usted decide hacer un experimento de expresión: Usa un microarray con 444 genes que, por diversos motivos (que su jefe también se niega a compartir) podrían resultar de interés; y lo ensayan con 3 réplicas técnicas contra una linea celular susceptible al virus (*cont1, cont2 y cont3*) y otra resistente (*test1, test2 y test3*). 

Los resultados se encuentran en el archivo `data.csv`. Pueden usar el [rserver](http://pi.iib.unsam.edu.ar/rserver/) como durante toda la cursada.


[comment]: <> (Su jefe, solo viendo los archivos de texto plano y sin ningún tipo de procesamiento o visualización, exclama un *¡eureka!* y le encarga comprar anticuerpos monoclonales de H3K9me3, entre otras cosas.)

- ¿Se le ocurre qué técnicas de *data mining* podemos usar para obtener algo de información sin el superpoder de leer patrones en tablas de texto plano?
