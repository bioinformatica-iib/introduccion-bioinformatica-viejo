---
layout: page
title: TP N°3
subtitle: Alineamientos de secuencias de a pares
data : True
menubar_toc: true
hero_height: is-small
toc_title: CONTENIDOS
construccion: true
---

{% if page.construccion %}

**Pagina en construccion**

{% else %}

{% if page.data %}

## Materiales

<a href="data/"> Descargar </a>

{% endif %}

## Objetivo

* Entender el funcionamiento básico del algoritmo de alineamiento de pares de secuencias de Needleman-Wunsch.
* Aprender a interpretar un Dot-Plot, pudiendo identificar las regiones relevantes que contienen patrones.
* Comprender los conceptos de similitud y homología de secuencias, y establecer una clara diferencia entre los mismos. 
* Realizar un alineamiento múltiple de secuencias e interpretar qué información importante se puede extraer del mismo. 

## Introducción

El alineamiento de secuencias de a pares comprende la asignación uno-a-uno de correspondencias entre los elementos que componen dichas secuencias sin alterar su orden. En dicho proceso tres eventos principales pueden tener lugar:
- **Match (M)**: Cuando los elementos enfrentados son equivalentes.
- **Mismatch (m)**: Cuando los elementos correspondientes son diferentes.
- **Gap (g):** Cuando un elemento de una secuencia no tiene par en la otra y se enfrenta a un espacio, caracterizado por un guión (-).
    - **Gap open:** Cuando se abre un gap.
    - **Gap extend:** Cuando se agregan gaps a continuación de otro gap.

Por ejemplo si alineamos las secuencias AFGIVHKLIVS y AFGIHKIVS un posible resultado sería:

> A F G I V H K L I V S  
> A F G I - H K - I V S

La principal función de los alineamientos es establecer una medida de **similitud** entre las secuencias que participan en el mismo. Para ello es necesario definir un **sistema de puntuación** que pese cada uno de los eventos que tienen lugar en la contrucción del alineamiento. Asimismo, este esquema de puntajes o *scoring* nos permitirá optimizar el alineamiento de forma tal que los algoritmos empleados elijan la correspondencia entre secuencias que maximice el puntaje o *score* global.

Existen varios algoritmos de alineamiento.
Los **alineamientos globales** (o de Needleman-Wunsch por sus creadores), se realizan apareando todos los elementos de una secuencia con todos los elementos de la otra. Este tipo de alineamientos se utiliza principalmente para comparar dos secuencias que son similares en longitud.
Los **alineamientos locales** (o de Smith-Waterman), parean únicamente parte de las secuencias y son útiles para identificar, por ejemplo, dominios en común.
Luego existen **alineamientos mixtos**, que combinan los dos anteriores.

## 1. Dynamic programming

Dado un par de secuencias y un sistema de puntuación o *scoring* se pueden aplicar diversos algoritmos para encontrar el alineamiento que dé el mejor puntaje. El algoritmo más popular utiliza un método matemático llamado *dynamic programming*. El mismo consiste en comparar ambas secuencias construyendo una matriz del alineamiento. Se comienza en el extremo superior izquierdo de la matriz, con un puntaje inicial de 0. En cada paso, se calcula el costo que tiene aparejado desplazarse de una celda a la otra, dado el sistema de puntajes preestablecido, y se elige la opción más favorable, es decir aquella que **maximice** el puntaje global del alineamiento, entre todas las posibles. Asimismo, en cada iteración se guarda el puntaje con el que se llegó a una dada celda y el movimiento que originó dicho camino o *path*, indicado típicamente con una flecha. Una vez que la matriz está completa en su totalidad se puede recorrer hacia atrás o realizar un *traceback*, desde el extremo inferior derecho al superior izquierdo, para reconstruir el alineamiento.

La principal ventaja de este método es que **siempre encuentra el alineamiento óptimo** entre las secuencias dadas. Sin embargo, puede que existan varios alineamientos que satisfagan esta condición. Otra desventaja es de origen técnica, la exhaustividad con la que el algoritmo realiza la búsqueda hace que su velocidad dependa de la longitud de las secuencias implicadas, lo cual lo hace poco eficiente para búsqueda de similitud de una secuencia contra una base de datos. Para esto existen diferentes adaptaciones del algoritmo que se verán más adelante.

Veamos un ejemplo, imaginen que queremos alinear las secuencias **TCGCA** y **TCCA** utilizando un esquema de *scoring* de M=1, m=-1, g=-2.
Para eso ubicamos las secuencias en una matriz, donde cada una de sus dimensiones corresponda a una de las secuencias, tal como se muestra en la siguiente figura. 

![Dynamic0](./images/NW_2.png)

Si observamos los *paths* **1** y **2** dibujados en las matrices de la figura podemos ver que se emplearon distintas estrategias para alinear este par de secuencias. 

* En **1** se eligió alinear los dos primeros nucleótidos **TC** por la diagonal, luego colocar un gap en la secuencia vertical **TCCA** y para finalizar se alinearon los nucleótidos **CA** restantes por la diagonal.      

* En **2** el primer nucleótido **T** de ambas secuencias se alineó por la diagonal, luego se colocó un gap en la secuencia vertical **TCCA** y finalmente se alinearon los 3 nucleótidos **GCA** y **CCA** restantes por la diagonal.      

Si computamos los puntajes de ambos alineamientos, obtenemos que **1** tiene un puntaje de 2, mientras que **2** un puntaje de 0. Esto es lógico dado que en **1** se propone colocar un único gap, lo cual permite, en consecuencia, alinear al resto de los nucleótidos en ambas secuencias con eventos de match. En contraposición, **2** sugiere una estrategia subóptima en relación a **1**, con un puntaje resultante más bajo, en la cual las secuencias estudiadas se aparean con 1 gap, 1 mismatch y 3 matches.

> Si hubiésemos aplicado la metodología de *dynamic programming* para realizar un alineamiento global de estas secuencias, ¿cuál sería el *path* óptimo resultante? 

A *priori* uno pensaría que es el *path* **1**, pero hagamos el ejercicio para corroborar si esto es efectivamente así. 

Para comenzar, refresquemos cómo funcionaba el método de *dynamic programming*.

![Dynamic1](./images/NW_3.png)

Para llegar desde el extremo superior izquierdo (= inicio) de la matriz del alineamiento a la posición marcada con una "x" roja podríamos, hipotéticamente, tomar cualquiera de los caminos dibujados en la figura de más arriba. Estos *paths* darían alinemientos diferentes de las secuencias **TC** con **TC**. 

Pero... ¿cuál es el procedimiento iterativo empleado por el método de *dynamic programming* para obtener el alineamiento óptimo entre dos secuencias ?

![Dynamic2](./images/NW_4.png)

> Para llegar a cualquier celda de la matriz, uno puede acceder por, como máximo, 3 direcciones. La idea es siempre moverse en la dirección que **maximice** el *score* o puntaje. 

Veamos que :

* un movimiento en la dirección horizontal, de la posición **(i, j-1)** a la posición **(i, j)**, supone introducir un gap en la secuencia del eje vertical i
* un movimiento en la dirección diagonal, de la posición **(i-1, j-1)** a la posición **(i, j)**, supone un match o un mismatch entre los nucleótidos enfrentados
* un movimiento en la dirección vertical, de la posición **(i-1, j)** a la posición **(i, j)**, supone introducir un gap en la secuencia del eje horizontal j

Teniendo en cuenta la fórmula para obtener el *score* enunciada más arriba, podemos comenzar con nuestro ejercicio. Recordemos que la matriz se llenará iterativamente, comenzando por la celda del extremo superior izquierdo, que tiene un puntaje de 0. 

![Dynamic3](./images/NW_5.png)

Para moverse del (0, 0) al (0, 1), hay una sóla opción, moverse en forma horizontal. Esto significa alinear T con un gap, lo cual da un score de 0 + (-2) = -2. 

```
eje j: T
eje i: -
```
Lo mismo pasa al moverse del (0, 0) al (1, 0), hay una sóla opción, moverse en forma vertical. Esto significa alinear T con un gap, lo cual también da un score de 0 + (-2) = -2. 

```
eje j: -
eje i: T
```

Para moverse del (0, 0) al (1, 1) hay 3 maneras, 

![Dynamic4](./images/NW_6.png)

* Hacer un movimiento vertical, lo cual nos daria un score de -2 + (-2) = -4 (-2 es el puntaje de la celda inicial (0, 1) y el movimiento vertical implica colocar un gap)

```
eje j: T -
eje i: - T
```

* Hacer un movimiento horizontal, similar al caso anterior, resultando en un score de -4 (-2 es el puntaje de la celda inicial (1, 0) y el movimiento horizontal implica colocar un gap)

```
eje j: - T
eje i: T -
```
* Hacer un movimiento diagonal, lo cual implica alinear ambos nucleótidos. Como son dos T en ambas secuencias, el score sería +1, que es el valor del match.

```
eje j: T 
eje i: T
```

Para decidir qué valor ubicamos en la celda simplemente optamos por el que nos dé el mayor score, en este caso 1, y se marca el movimiento que lo produjo: un movimiento diagonal.

De esta manera podemos seguir completando la matriz, 

![Dynamic5](./images/NW_7.png)

Obsevando la última celda computada, podemos ver que hay nuevamente 3 maneras de llegar a la misma, 

* Hacer un movimiento vertical, de (1, 3) a (2, 3), lo cual resulta en introducir un gap en la secuencia horizontal j. Si (1, 3) tiene un *score* de -3, -3 + gap penalty = -3 + (-2) = -5, que es el número registrado en la flecha en dirección vertical.

* Hacer un movimiento horizontal, de (2, 2) a (2, 3), lo cual resulta en introducir un gap en la secuencia vertical i. Si (2, 2) tiene un *score* de 2, 2 + gap penalty = 2 + (-2) = 0, que es el número registrado en la flecha en dirección horizontal.

* Hacer un movimiento diagonal, de (1, 2) a (2, 3), lo cual resulta en alinear los nucleótidos G y C. Si (1, 2) tiene un *score* de -1, -1 + mismatch = -1 + (-1) = -2, que es el número registrado en la flecha en dirección diagonal.   

Si se calcula el max(-5, 0, -2) = 0, que es el puntaje que se generó por el movimiento horizontal. Entonces colocamos 0 en la celda (2, 3) y una flecha horizontal que indique el movimiento de (2, 2) a (2, 3).

Al completar todas las celdas de la matriz, podemos saber cuál es el puntaje de la celda ubicada en extremo inferior derecho, que en este caso resultó ser +2. Este también es el puntaje final del alineamiento.  

![Dynamic5](./images/NW_8.png)

Para reconstruir el mismo, se parte de la celda ubicada en extremo inferior derecho y se siguen las flechas hasta llegar a la celda de inicio, en el extremo superior izquierdo. 

![Dynamic5](./images/NW_9.png)

Las flechas en rojo resaltan el *path* del alineamiento, 

```
eje j: T C G C A
eje i: T C - C A 
```
que podemos corroborar que es idéntico al *path* **1** del ejemplo que se planteó inicialmente. 

#### Ejercicios

1.1 En grupo, realizá el alineamiento de las secuencias **ATTGG** con **AGATGG**, usando el esquema de puntajes: M=1, m=-1, g=-2. 

Para esto, abrí el siguiente [Google Jamboard](https://jamboard.google.com/d/1aWUWAhRLroqffKFz0Ke7XDOG3nWRrruXC5Gku5UvbOU/edit?usp=sharing), guardá una copia local del mismo en tu Google Drive y compartí el GJamboard a tus compañeros de equipo. 

> **¡Atención!** Para guardar una copia local del GJamboard en tu GDrive, cliqueá en el ícono con 3 puntitos, en el extremo superior derecho (Más acciones). Luego seleccioná la opción "Hacer una copia". Elegí la carpeta adonde deseas guardarlo dentro de tu unidad y cliqueá aceptar. 

¡Ahora estás listo para empezar! Recordá rellenar la matriz con todos los puntajes y flechas faltantes. Cuando termines, reconstruí el *path* del alineamiento.

1.2 Cuando termines el ejercicio anterior podés corrobar la solución que hallaste ingresando en [UniFreiburg-FreiburgRNATools](http://rna.informatik.uni-freiburg.de/Teaching/index.jsp?toolName=Needleman-Wunsch).

Seguí las siguientes instrucciones para usar este recurso web:

a. Ingresá las dos secuencias que querés alinear en los recuadros de **Input** **Sequence a** y **Sequence b**. 
Recordá que la secuencia que figura en tu matriz en sentido horizontal debe ser ingresada como **Sequence b** y la que figura en sentido vertical debe ser ingresada como **Sequence a**.

b. Seleccioná optimización de Similarity. 

c. Completá los valores de tu esquema de *scoring*.

En el output podrás apreciar dos salidas:

* A la izquierda, los valores de la matriz de alineamiento. Si cliqueas sobre los valores de la matriz, vas a observar que el valor sobre el que te paraste se colorea en verde, mientras que las celdas que dieron origen a ese valor se colorean en rosa. 

* A la derecha, se observa el alineamiento final, donde un match se esquematiza en con \*, un mismatch con \| y un gap con \_.

1.3 Respondé a las siguientes preguntas:

1.3.1 Reproducí el alineamiento que vimos como ejemplo al inicio (**TCGCA** con **TCCA**, esquema de puntajes: M=1, m=-1, g=-2) en la web de la [UniFreiburg-FreiburgRNATools](http://rna.informatik.uni-freiburg.de/Teaching/index.jsp?toolName=Needleman-Wunsch)

¿Cuántas soluciones óptimas hay para este alineamiento? ¿Sucede lo mismo para el alineamiento que realizaste en el **Ejercicio 1**? ¿Por qué?

1.3.2 Observá con detenimiento el output del panel de la izquierda (la matriz) 

¿Qué sucede cuando seleccionás una celda y se colorea en verde y 2 celdas aledañas a la misma se colorean en rosa? 

1.3.3 Finalmente te propongo que realices el siguiente alineamiento: 

> Sequence a: AGATGG y Sequence b: ATTGGG. 

> Seleccioná optimización de Similarity. 

> Esquema de puntajes: **M:1, m:-1, g:-5**. 

Registrá con atención el resultado. Ahora cambiemos el esquema de *scoring*, dejando el mismo valor para match, pero intercambiando los puntajes de gap y mismatch. 
¿Cómo cambió el output? ¿Qué observás ahora en las secuencias halladas como solución óptima en comparación a lo que arrojaba el algoritmo con los parámetros anteriores?


## 2. Dot-Plots

Los dot-plots son representaciones gráficas que dan un pantallazo sobre la similitud entre dos secuencias. En ellos se pueden identificar patrones que aporten información sobre la relación entre ambas secuencias.
La forma de obtener uno es muy sencilla: se establece una matriz donde cada elemento de una de las secuencias se corresponde con una fila y los de la otra con una columna. Acto seguido se procede a colorear cada celda donde los caracteres correspondientes a fila y columna sean equivalentes.
Por ejemplo:

![DotPlot](./images/DotPlot1.jpeg)

Nosotros podemos utilizar la herramienta de EMBOSS **dotmatcher** para generar nuestros propios plots. 

> Recordatorio: Para ver qué parámetros toma de entrada la función, correr en la terminal **dotmatcher -h**.

#### Ejercicios 

2.1 Utilizá la secuencia *HS-ch11-fragment.fasta* que se encuentra en la carpeta *data* para compararla contra sí misma. Esta secuencia es un pequeño fragmento del cromosoma 1 de *Homo sapiens* y la vamos a utilizar únicamente para ver algunos de los patrones que podemos encontrar en un dotplot. 

Generá un dotplot utilizando la secuencia HS-ch11-fragment.fasta contra sí misma.

```Bash
dotmatcher -graph X11 HS-ch1-fragment.fasta HS-ch1-fragment.fasta
```

**¿Qué podés interpretar de este dotplot?**

La verdad es que el plot es bastante ruidoso, esto sucede muy a menudo en secuencias genómicas ya que la cantidad de caracteres que componen las secuencias es muy limitada (solo 4) y por ello hay muchas ocurrencias y por lo tanto muchos puntos.
Para limpiar el plot y quedarnos con los matches más significativos podemos jugar con dos parámetros:

* *windowsize*: Tamaño de ventana
* *threshold*: Umbral de ocurrencia

Esto quiere decir que **dotmatcher** sólo va a poner un punto cuando un fragmento del largo *windowsize* contenga un score mayor a *threshold*.
Por ejemplo:

```Bash
dotmatcher -graph X11 -windowsize 50 -threshold 20 HS-ch1-fragment.fasta HS-ch1-fragment.fasta
```

Si aumentás estos parámetros podés ir eliminando fragmentos que corresponden a secciones compartidas más cortas, sin embargo existe una relación de compromiso, utilizar tamaño de ventana y umbral muy grandes nos llevan a perder información por lo que hay que seleccionarlos con cuidado. Aqui hay algunos patrones con los que te podés encontrar en este tipo de plots:

![DotPlot](./images/DotPlot_patterns.png)

**a)** Match perfecto.  
**b)** Repeticiones.  
**c)** Palíndromo.  
**d)** Repeticiones invertidas.  
**e)** Zonas de baja complejidad (microsatelites).  
**f)** Zonas altamente repetitivas (minisatelites).  
**g)** Secuencias con alta conservación.  
**h)** Inserción o deleción.  

2.2 Cambiá los parámetros *windowsize* y *threshold* hasta obtener un plot que te parezca adecuado. **¿Qué podés interpretar del mismo?** Identificá patrones.

## 3. Similitud y Homología

Los términos similitud y homología se suelen utilizar como sinónimos por muchos investigadores, sin embargo no son. La similitud es una característica cuantitativa de un par de secuencias, donde se establece en qué grado estas se parecen (por ejemplo aplicando los algoritmos antes vistos, utilizando un sistema de puntaje). La homología, por otro lado, es una característica cualitativa, dos secuencias son o no son homólogas, **decir que un par de secuencias tiene N% de homología es incorrecto**. Homología implica específicamente que el par de secuencias estudiadas provienen de un mismo ancestro común. Esta afirmación es completamente hipotética, ya que, salvo en contados casos, no se puede corroborar. Uno puede inferir que este es el caso dado la similitud observada en las secuencias actuales, sin tener acceso a las secuencias ancestrales.
A partir de esta relación entre similitud y homología se puede aplicar para inferir relaciones entre diferentes especies, buscar posibles funciones de una secuencia desconocida, etc.

#### Ejercicios

3.1 Determinar qué especies están más relacionadas utilizando la ribonucleasa pancreática de caballo (*Equus caballus*), ballena enana (*Balaenoptera acutorostrata*) y canguro rojo (*Macropus rufus*).

3.1.1 Descargá las secuencias antes mencionadas de la carpeta del TP.  
3.1.2 Utilizá la herramienta de alineamiento global de EMBOSS **needle** (pueden leer el manual para ver que opciones admite) para comparar las tres secuencias.   

```Bash
needle -gapopen 10 -gapextend 1 -asequence *secuencia_1* -bsequence *secuencia_2* -outfile *salida*
```
3.1.3 Observá e interpretá las salidas obtenidas. ¿Qué secuencias son más similares? ¿Tiene sentido el resultado obtenido?

3.1.4 Analizá árbol filogenético de la Fig. 1 del [paper](https://drive.google.com/file/d/1CHS7KCkgDQvzqQ2A_l4y4LKRaoo8Eraf/view?usp=sharing) de O'Leary *et al.*, 2013. 
Sabiendo que los caballos y las ballenas pertenecen al clado *Euungulata* y los canguros al clado *Marsupialia*, ubicá estos clado en el árbol.
¿Esta información apoya los resultados que obtuviste en 3.1.3?


![Animales](./images/Animales.png)

3.2 Realizá el mismo procedimiento pero esta vez para determinar si los mamuts (*Mammuthus primigenius*) son más cercanos a los elefantes africanos (*Loxodonta africana*) o asiáticos (*Elephas maximus*) utilizando la secuencia de la cadena alfa de la hemoglobina.  

3.2.2 ¿Qué te sugieren los resultados obtenidos?  
3.2.3 ¿Qué otras explicaciones pueden satisfacer estos resultados?  
3.2.4 Proponé soluciones para los problemas encontrados.  

![Elefantes](./images/Elefantes.png)


## 4. Alineamientos múltiples

Un alineamiento múltiple (MSA) involucra tres o más secuencias biológicas. Debido a que la tarea de alinear múltiples secuencias de largos biológicamente significativos suele ser muy demandante en términos de recursos computacionales y tiempos de ejecución estos requieren metodologías más sofisticadas para llevarse a cabo. Por ello la mayoría de los programas disponibles para realizar MSA utiliza heurísticas en vez de algoritmos de optimización global.

>**Heurística:** es una estrategia que busca resolver un problema más simple cuya solución intersecta con la solución de un problema más complejo. Generalmente esto implica que no es seguro encontrar el mejor resultado pero sí una solución que sea aceptable. Las heurísticas se aplican con frecuencia en computación para poder resolver problemas que por su complejidad serían imposibles de abordar dados los limitados recursos con los que se cuentan.

Dadas las secuencias de aminoácidos de un set de proteínas que se quieren comparar, el MSA muestra los residuos de cada proteína en una fila junto con los gaps que le correspondan de tal manera que todos los residuos "equivalentes" se encuentren en la misma columna. El significado de equivalencia depende por lo general del contexto: para alguien que hace una filogenia puede significar que comparten una ancestro común; un biólogo estructural puede interpretar que son residuos que corresponden a posiciones análogas de un plegado determinado; para el biólogo molecular, residuos equivalentes juegan roles funcionales similares dentro de sus proteínas correspondientes. En cada caso un MSA provee un pantallazo sobre las restricciones evolutivas, estructurales o funcionales que caracterizan un set de proteínas de una manera visual e intuitiva.

![MA0](./images/MA0.png)

Un pipeline típico para realizar un MSA seria:
1. Formular la pregunta que se quiere contestar. Por ejemplo,  "¿Qué estructura secundaria adopta X región de mi proteína de interés?"
2. Obtener secuencias que puedan contestar a mi pregunta. Por ejemplo, secuencias que estén relacionadas a mi proteína de interés.
3. Utilizar alguno de los programas disponibles para llevar a cabo el MSA. Por ej. EMBOSS
4. Realizar ajustes manuales para corregir posibles errores de los algoritmos de alineamiento.

#### Ejercicios

> ¡Atención! Antes de comenzar a resolver los ejercicios, instalá **ClustalW** en tu VM, escribiendo el siguiente comando en la terminal:

```Bash
sudo apt install clustalw
```

La gp120 es una proteína que recubre al virus del HIV y facilita su unión e ingreso a la célula que infecta (linfocitos CD4+)
Entre nuestros archivos contamos con un multifasta (gp120.fasta) que contiene 27 secuencias de gp120 de HIV-1, HIV-2 y SIV.
Estas proteínas contienen 9 puentes disulfuro conservados. También es de interés el loop V3, una porción expuesta de la proteína, conocido target de anticuerpos el cual constituye una región hipervariable dada la presión selectiva a la que se ve sometido. Pueden ver la disposicion de los diversos elementos de gp120 en [este esquema](http://www.cbs.dtu.dk/dtucourse/cookbooks/hnielsen/gp120.farve.gif).

4.1 Utilizá las herramientas de EMBOSS para realizar un alineamiento múltiple con las secuencias de gp120 (recuerden que para buscar herramientas pueden usar *wossname*)  

Pista: El comando a utilizar es **emma**. Para ver la ayuda, tipeá emma -help en la terminal.

4.2 Utilizá el comando **showalign** de EMBOSS para obtener una mejor visualización del alineamiento.  

4.3. Observá el alineamiento, como primer control podemos corroborar que las 18 Cisteínas (**C**) estén bien alineadas.  

4.4 Utilizá el esquema de gp120 para identificar diversas regiones ya sea conservadas o muy variables (Estructuras, loops, etc.)  
 **Notá que las posiciones en el alineamiento cuentan gaps por lo que no se corresponden exactamente con el esquema, utilizá las posiciones de las cisteínas conservadas para identificar diferentes regiones.**

{% endif %}
