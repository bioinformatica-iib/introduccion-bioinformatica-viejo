## TP Integrador de Introducción a la Bioinformática

Este es un **trabajo práctico integrador** en el que deberán aplicar todos los conocomientos y herramientas adquiridas durante de la cursada a un problema puntual. La finalidad de este trabajo es evaluar la capacidad técnica para producir resultados, así como también su criterio a la hora de evaluar el significado biológico de los mismos.

### Modalidad 

El trabajo deberá ser entregado en forma escrita (como un informe de laboratorio), y en formato digital. Para aprobar deberá cumplir con AL MENOS las consignas propuestas (debidamente señaladas). Esto significa que pueden extender el análisis cuanto gusten. ¡Sean creativos! El trabajo deberá ser realizado con la misma persona con la que realiza los TPs normalmente. 

Dado que es un TP para hacer en casa, apelaremos a su buena voluntad y honestidad profesional... de todos modos, cabe advertir que **cualquier atisbo de plagio será severamente sancionado, equivalente al de copiarse en un examen**. 

> Nota: no subestimen la capacidad de un (bio)informático para hallar *atisbos* de plagio. 

### Consultas

Pueden consultar en cualquier momento acerca de las herramientas necesarias o sobre la interpretación de los resultados provistos. Los docentes se reservan el derecho a no resolver la pregunta si consideran que deberían saber la respuesta. 

### Consideraciones generales

**Fecha de entrega:** 19/06 (o antes)

- En todos los casos en los que utilicen algoritmos que requieran parámetros, indíquenlos debidamente y justifiquen su elección si lo consideran necesario.
- Agreguen a su reporte todos los resultados (figuras o texto) que consideren necesarios. Puede ser una *fotito*/*snapshot* de lo que aparece en pantalla, o pueden ponerlo en un archivo aparte (si el resultado fuera muy largo) y referenciarlo desde el texto.
- Tendrán que leer e investigar acerca de el o los virus relacionados para dar sentido biológico a los resultados. Esto significa que no les va a alcanzar con lo que vimos/hicimos para hacer un buen TP. *Sorry, not sorry*.

### Propuesta

Usted trabaja en un laboratorio que tiene a su cargo la vigilancia  epidemiológica nacional de varios agentes infecciosos. Como parte del mismo, todos los días se obtienen clones y secuencias de nuevos aislamientos. Su jefe lo pone a cargo de analizar varios aislamientos, cuya secuencia ya ha puesto en el dominio público, para determinar si todos corresponden al mismo agente etiológico: SARS-CoV-2.

#### Tareas mínimas a realizar:

- **Búsqueda de secuencias**: Obtenga las secuencias genómicas de los aislamientos que le pasó su jefe. 
- **Alineamiento de a pares**: Realice un alineamiento entre la secuencia de referencia y una secuencia al azar entre las que acaba de descargar. 
- **Marcos abiertos de lectura**: Obtenga las secuencias correspondientes a la proteína N de todos los aislamientos y constrya una fasta múltiple con ellas 
- **Desorden intrínseco**: Evalúe el desorden intrénseco de las proteínas `N`, `S` y `ORF1ab` (elija una aislamiento al azar). ¿Qué patrones de desorden encuentra?¿Qué correlato podrían tener los dominios desesctructurados hallados con la función biológica de la proteína?
- **Construcción de un un alineamiento múltiple**: Genere un alineamiento múltiple de a partir de un fasta múltiple conteniendo:
  - Los genomas completos de todos los aislamientos o
  - La proteína E (en caso de que la compu tarde mucho o se cuelgue!)
- **Construcción de una PSSM o un HMM**: Realice un alineamiento múltiple de la proteína E. Construya una PSSM o un HHM. ¿Para qué podría usar esta herramienta?
- **Construcción de un árbol filogenético**: Construya un árbol filogenético utilizando cualquier estrategia que considere apropiada (justifique su elección). 

#### Extras para entusiastas

##### Ejercicio de *parseo* de datos

Su jefe le ha encargado la utilización predictores para hallar dominios funcionales y ontologías (PFAM, Gene Ontologies, InterPro, etc). Le pide que reporte sus resultados en formato de tabla.

| Gen | Anotación |
| --- | ----------- |
| gen1 | anotacion 1 |
| gen1 | anotacion 2 |
| gen2 | anotacion x |
| ... | ... |

##### Ejercicio de visualización y anotación

Su jefe, a esta altura, ya está bastante convencido de cuál es el origen del virus (en términos filogenéticos, al menos). No obstante, como tiene problemas de confianza, no lo ha compartido con usted aún (y probablemente no lo hará, porque está bastante loquillo). En su lugar, le ha provisto de una secuencia de referencia con sus correspondientes anotaciones (`reference.gb` y `reference.fasta`) y le ha pedido que anote (es decir, que coloque qué es cada secuencia codificante) el genoma del aislamiento y que lo guarde en un archivo tipo EMBL. 

Además, su insanísimo patrón le ha advertido acerca de la presencia de regiones no codificantes repetitivas en este tipo de organismos. Le encarga hallarlas en el genoma de este aislamiento, anotarlas, e hipotetizar acerca de su posible función.

##### Ejercicio de short-read mapping y variant calling

Un colaborador ha observado, en esayos fenotípicos, que ciertas lineas celulares presentan resistencia a la infección viral. El mecanismo de resistencia es, a priori, desconocido. Lo único notable es que las células presentan muy baja tasa de infección (incluso a altas concentraciones de viriones). Su director ha obtenido lecturas cortas de secuenciación Illumina (*paired end*) del genoma de dicha linea celular, y ha hecho un sorteo entre todos sus becarios para repartir los cromosomas a estudiar. A usted le ha tocado un fragmento del cromosoma 12. 

- [Lecturas *forward*](https://www.dropbox.com/s/w6m6sc9ed3b8l2m/chr12-res.bwa.read1.fastq.gz?dl=0)
- [Lecturas *reverse*](https://www.dropbox.com/s/l5r9gi51x5o1bus/chr12-res.bwa.read2.fastq.gz?dl=0)

Realice el mapeo de dichas lecturas al genoma de referencia (`chr12-fragment.fasta`, secuencia; `chr12-fragment.gb`, anotaciones) y evalué si existen mutaciones con potencial para conferir resistencia al virus (si la/s halla, hipotetice el motivo por el cual dicha/s mutación/es funciona brindando resistencia a la linea celular). 

Usted ya hizo esto alguna vez en su vida, por lo que ya tiene script escrito `seqprep.sh`. Actualice dicho script con la secuencia de interés y explique qué hace cada comando.

Luego de correr el script debería tener algo así (no hace falta que lo corran: el link de abajo es el resultado que obtendrían)
- [mapping-sorted.bam](https://www.dropbox.com/s/ir1xro5ynqp6rd9/mapping-sorted.bam?dl=0)

¿Encontró algo interesante?

##### Ejercicio de programación y data mining

Finalmente, para corroborar las observaciones de los ejercicios anteriores, usted decide hacer un experimento de expresión: Usa un microarray con 444 genes que, por diversos motivos (que su jefe también se niega a compartir) podrían resultar de interés; y lo ensayan con 3 réplicas técnicas contra una linea celular susceptible al virus (*cont1, cont2 y cont3*) y otra resistente (*test1, test2 y test3*). 

Los resultados se encuentran en el archivo `data.csv`. Pueden usar el [rserver](http://pi.iib.unsam.edu.ar/rserver/) como durante toda la cursada.

Su jefe, solo viendo los archivos de texto plano y sin ningún tipo de procesamiento o visualización, exclama un *¡eureka!* y le encarga comprar anticuerpos monoclonales de H3K9me3, entre otras cosas.

- ¿Se le ocurre qué técnicas de *data mining* podemos usar para arribar obtener algo de información sin el superpoder de leer patrones en tablas de texto plano?
- Luego de todo el análisis, ¿Tiene sentido el encargo, o su jefe solo pretende derrochar fondos públicos?
