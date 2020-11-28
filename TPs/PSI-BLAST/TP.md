# Construcción de Logos y Matrices peso-específicas  

## Objetivos

En este TP utilizaremos herramientas bioinformáticas para predecir la unión de peptidos a MHC y seleccionar potenciales epítopes como candidatos para desarrollar una vacuna.  

Los pasos a seguir serán:  

1. Identificación de motivos de unión de MHC.  
2. Visualización de motivos utilizando logos de secuencia.  
3. Entrenamiento de métodos de predicción de unión a MHC.  
4. Utilización de los métodos desarrollados para la selección de candidatos a vacuna.  

## Unión de peptidos a MHC

Este paso es el más selectivo en la identificación de péptidos inmunogénicos ya que sólamente 1 en 200 péptidos forma un complejo con el MHC. Existe una gran varidedad de MHC diferentes, cada uno con una alta especificidad.  
El motivo de unión de los MHC de clase I es, en la mayoría de los casos, de 9 aminoácidos de longitud. Estos estan caracterizados por una marcada preferencia por ciertos aminoácidos en ciertas posiciones del motivo. Estas posiciones son llamadas "anclas". Para una gran cantidad de complejos de MHC clase I estas anclas se encuentran en las posiciones P2 y P9. Sin embargo, este no siempre es el caso.  
Existe una gran cantidad de datos que describen las diferentes especificidades de las moleculas de MHC. Una base de datos muy conocida que almacena esta información es [SYFPEITHI](http://www.syfpeithi.de/). En ella se puede encontrar informacion de ligands y motivos de MHC.  
Con este tipo de información es posible desarrollar un modelo de predicción de unión de péptidos a MHC y usarlo para descubrir nuevos epitopes con los cuales diseñar vacunas. Esto puede ser aplicado a nivel de proteomas enteros para ahorrar tanto tiempo como recursos.  

A continuación vamos a:

1. Visualizar motivos de unión utilizando logos de secuencia.  
2. Entrenar un modelo predictivo utilizando el servidor de *Easypred*.  
3. Aplicar el modelo para seleccionar péptidos con potencial inmunogénico de proteínas de SARS-CoV.  

## Identificación de motivos de unión a MHC

Vayan a la página de [SYFPEITHI](http://www.syfpeithi.de/). Allí, una vez que hagan *click* en el logo, pueden buscar motivos con el botón **Find motif, Ligand or epitope**. Allí seleccione con el menu de la izquierda el alelo de MHC **HLA-A*02:01** y presione **do Query**. El resto de las opciones se pueden usar para refinar la búsqueda, limitandola a ligandos de proteínas determinadas o por referencia bibliográfica. En este caso queremos obtener **TODOS** los ligandos para poder ver que características comparten.  

En el resultado de la búsqueda podemos ver las posiciones ancla (*anchor*) con los aminoácidos preferidos en esas posiciones. También podemos ver si existen posiciones con residuos preferidos, osea, que aparecen más seguido en los ligandos identificados. A continuacion tenemos una lista de otros aminoácidos que se ven con frecuencia en los ligandos del alelo que estamos estudiando y por último la lista de los ligandos que existen en esta base de datos, junto a su proteina de procedencia, la referencia del trabajo donde se lo identificó y alguna nota como la asociación de ese péptido con alguna enfermedad.  

1. Identifique la preferencia de aminoácidos del alelo estudiado en las posiciones ancla.  

## Logos de secuencia

Esta es una herramienta muy útil para visualizar motivos de unión. En un logo de secuencia se grafica el contenido de información en cada posición de un motivo, el cual esta representado por el alto de la columna. A su vez, cada letra dentro de cada columna tiene un tamaño proporcional a la frecuencia con la que aparece en esa posición.  
Un servidor que nos permite generar facilmente logos de secuencia es [Seq2Logo](http://www.cbs.dtu.dk/biotools/Seq2Logo/). Este método nos da la opción de ingresar un alineamiento multiple, una lista de péptidos o matriz peso-específica con la cual realizar la gráfica. La información puede pegarse directamente en el cuadro de texto que allí se ve, o subiendo directamente el archivo que la contiene utilizando la opción *Switch to file upload* que se encuentra debajo del cuadro.  

> Recuerde que el gráfico es el resultado del calculo de contenido de información para cada posición, tal como lo vieron en la teoria, por lo que puede variar según los criterios que apliquen.  

Dentro de las opciones que nos permite cambiar tenemos:  

* **tipo de logo:**  Por lo que existen diferentes variantes que se pueden utiizar (Kullback-Leiber, Shannon, etc.).  
* **Método de clustering:** se encarga de agrupar las secuencias que son muy similares para no sesgar el resultado.  
* **Weight on prior:** éste es el valor que le asignamos al parámetro beta en la ecuacion del cálculo de contenido de información. Recuerde que la relacion entre *alfa* y *beta* es determinante para este cálculo.   
* **Unidad de información:** generalmente esta medida en bits, pero en algunos casos se opta por *half-bits*.  
* **formato de salida:** bastante autoexplicativo.  

También tenemos la opción de realizar cambios avanzados, como modificar las frecuencias de background o la matriz de scoring, limitar la región del alineamiento que queremos graficar, etc. y opciones gráficas, como el tamaño de la imagen y los colores con los que se representa cada aminoácido.  

Por convención los colores que se utilizan son:  

* Rojo: Aminoácidos ácidos [DE]  
* Azul: Aminoácidos básicos [HKR]  
* Negro: Aminoácidos hidrofóbicos [ACFILMPVW]  
* Verde: Aminoácidos neutros [GNQSTY]  

En la carpeta del TP pueden encontrar los archivos **HLA-A01**, **HLA-A0201** y **HLA-B27**, los cuales contienen ligandos de cada uno de estos alelos de MHC. Utilicelos para generar logos que muestren sus motivos de preferencia. **Utilicen como opción de clustering Heuristics.**

2. Identifique las posiciones ancla y las preferencias de cada alelo. ¿El gráfico obtenido de HLA-A02:01 se condice con lo que encontró en la base de datos?

## Construcción de matrices peso-específicas

Para este punto vamos a utilizar el servidor de [EasyPred](http://www.cbs.dtu.dk/biotools/EasyPred/). Esta herramienta nos permite tanto construir matrices peso-específicas como aplicarlas a set de datos para calcular su score. El servidor consta de dos cuadros de texto, el de la izquierda con el cual se ingresan datos para construir la matriz y el de la derecha donde uno puede ingresar secuencias sobre las cuales quiere realizar una predicción.

Para explorar un poco la construcción de matrices solo utilizaremos el recuadro de la izquierda donde ingresaremos las siguientes secuencias:

```Bash
VFAAA  
VHYWW  
VLQPK  
LREWQ  
LPYIH  
```

Las opciones que tenemos aquí son muy similares a las que habiamos visto en el servidor de *Seq2Logo* debido a que ambos realizan cálculos de contenido de información.  
En este caso vamos a seleccionar que no se lleve a cabo **ningun tipo de clustering** y que el **weight on prior** (beta) sea de 10000.

Hagan *submit* y observen la salida. Allí podrán encontrar información sobre los parámetros utilizados y un logo que representa el set de datos que ingresamos.

Observando el logo generado:  
3. ¿Cuántos aminoácidos puede hallar en la posición P1?  
4. ¿Cuántos aminoácidos diferentes hay en P1 de los datos de entrada?  
5. ¿A qué se debe esta diferencia?  


## Predicción de unión a MHC

Habiendonos familiarizado con la interfaz de [EasyPred](http://www.cbs.dtu.dk/biotools/EasyPred/) vamos a utiizarlo para entrenar un modelo con más datos y ponerlo a prueba. Para eso utilizaremos dos sets de entrenamiento que poseen péptidos fueron testeados con el alelo HLA-A02:01. Cada uno tiene un valor asociado que denota si son positivos (1) o negativos (0.1). A lo largo del proceso iremos variando diferentes parámetros para observar que efectos produce en el poder predictivo del modelo al ser testeado en un set de evaluación con valores de affinidad de unión a MHC reales (convertidos entre 0 y 1). 

Los datos que utilizaremos están en los archivos:

* **Entrenamiento_chico.set** que contiene 110 peptidos de los cuales solo 10 son positivos.  
* **Entrenamiento_grande.set** contiene 232 peptidos de los cuales todos son positivos.  

Para evaluar el desempeño de nuestro modelo utilizaremos el archivo **Evaluacion.set**, el cual contiene 1266 peptidos con valores de affinidad convertidos al rango 0-1 mediante la formula 1-log(x)/log(50000). Utilizando esta transformación, valores mayores a **0.638** (equivalente a 50nM) representan una unión fuerte, entre **0.638** y **0.426** (equivalente a 500nM) una unión débil y péptidos con valores menores a **0.426** no se consideran ligandos. En el caso de la transformación.  

Para analizar el desempeño de nuestros modelos vamos a tener en cuenta dos métricas:  
* **Aroc:** este valor varía entre 0 y 1, siendo 1 el puntaje perfecto y 0.5 el valor aleatorio. Por regla general, valores mayores a 0.85 son altamente deseables.  
* **Coeficiente de Pearson:** también oscila entre 0 y 1 siendo 1 el puntaje perfecto, pero en este caso el valor que implica aleatoriedad total es 0.  
Estas nos van a ayudar a seleccionar el mejor de nuestros modelos, siendo este el que alcance los mejores valores.

> **A continuación vamos a entrenar varios modelos y comparar sus resultados. Haga cada prueba en una ventana nueva o guarde las salidas de alguna manera que crea conveniente.** 

### Primera prueba

Vuelva a abrir [EasyPred](http://www.cbs.dtu.dk/biotools/EasyPred/) o recargue la página para que todas las opciones vuelvan a estar por defecto y realice los siguientes cambios: utilice los datos del archivo **Entrenamiento_chico.set** en el recuadro de entrenamiento y los de **Evaluacion.set** en el recuadro de evaluación. Coloque el **umbral de corte para positivos** (*Cutoff for counting an example as a positive example*) en 0 y dele a *Submit*.  

La salida consta de varias partes. Al principio tenemos una pequeña descripción de los parametros con los que se llevo a cabo el entrenamiento, tanto de los datos como del método. Esto es siempre útil para poder reproducir los resultados. Luego tenemos un logo construido a partir de los datos de entrenamiento. Esto nos puede ayudar a identificar (como hicimos anteriormente) la preferencia de la molecula que se une a nuestro set de péptidos. A continuación sigue la información sobre la evaluación. Allí podemos encontrar los valores de Pearson y Aroc y la lista de predicciones sobre el set de evaluación. Fíjense que *Assignment* se refiere al valor medido que esta en el archivo de evaluación y va de 0 a 1, sin embargo la predicción puede adoptar otros valores, incluso negativos. Las métricas que utilizamos no se basan en la precisión a la hora de encontrar el valor sino que haya una correlación entre los valores predichos y reales.  

Revisando la salida conteste:  
6. ¿Que valores de AUC y Pearson obtuvo?  
7. Viendo el logo resultante ¿Entiende por qué el modelo tiene tan mal desempeño?  
8. ¿Cuántos de los 110 péptidos se utilizaron en el entrenamiento?  

### Segunda prueba

Vuelva a la página principal de [EasyPred](http://www.cbs.dtu.dk/biotools/EasyPred/). Esta vez coloque el **umbral de positivos** en 0.5 pero especifique que no haya **clustering** y ponga un **weight on prior** de 0.0.
 
9. ¿Qué valores de desempeño tenemos ahora?  
10. ¿Cuántos de los 110 péptidos se utilizaron en este caso?  
11. Mirando el logo ¿Se parece al motivo de unión de HLA-A02:01 que habíamos visto?  

### Tercera prueba

Vuelva atrás y repita el caso anterior pero seleccionando **Clustering at 62% identity**. mantenga el **weight on prior** en 0.0.

12. ¿Cuál es el desempeño ahora?  
13. ¿Cambió el logo con respecto al anterior?  

### Cuarta prueba

Vuelva una vez más, manteniendo **Clustering at 62% identity** pero utilice como **weight on prior** un valor de 200.

14. Una vez más revise las métricas de desempeño.  
15. Mirando el logo ¿Cuál es la gran diferencia con aquellos que veniamos viendo? ¿Cuál es la razón de este cambio? ¿Empieza ahora a parecerce a los motivos que habíamos visto antes?  

### Última prueba

Hasta ahora veniamos utilizando un set de datos sumamente reducido, con solo 10 péptidos positivos para entrenar. Aún asi hemos conseguido valores de desempeño muy aceptables. Sin embargo, estos métodos suelen utilizar bastante más información para su entrenamiento.  
A continuación recarguen la página de EasyPred y carguen para entrenar el archivo Entrenamiento_grande.set. En el cuadro de evaluación volvemos a cargar Evaluacion.set. Seleccionemos una vez más **Clustering at 62% identity** y pongamos el **weight on prior** en 200. Tilden también la opción **Sort output on predicted values** para ver la tabla de péptidos ordenada por los valores de predicción.

16. Revise una vez mas los valores de desempeño.
17. Vea el logo, ¿qué le parece?
18. Mirando la tabla de predicciónes ¿Cuántos falsos positivos encuentra entre los primeros 20 péptidos? (con *Assignment* menor a 0.426)

> **Antes de cerrar la ventana haga *click* en *Parameters for prediction method*. Allí podrá descargar la matriz calculada a partir de los datos de entrenamiento (Se descarga con el nombre para.dat). Esta puede ser utilizada luego para llevar a cabo predicciones.**

## Encontrando epítopes en proteínas

Para finalizar vamos a utilizar nuestra matriz peso-específica para encontrar epítopes potenciales en la proteína de la nucleocápside del virus SARS-CoV que pueden encontrar en el archivo NCAP_CVHSA.fasta.  
Recarguen EasyPred. El recuadro de entrenamiento debe quedar vacio. Ingresen el archivo con la secuencia de la proteína en el recuadro de evaluación y suban el archivo con la matriz que descargaron en el paso anterior abajo donde dice **Load saved prediction method**. Utilicen los parámetros que crean mas convenientes según lo que hemos visto anteriormente, seleccionen **Sort output on predicted values** y denle *Submit query*.

LISTO! ahora en la salida ya no hay logos ni métricas porque ya no estamos entrenando ni testeando. Estamos utilizando un modelo ya entrenado para hacer predicciones en datos que nunca vió. La lista de péptidos son todos aquellas secuencias de 9 aminoácidos que se pueden obtener de la secuencia que le administramos al servidor junto con el valor de predicción. Los péptidos de arriba de la lista son aquellos que mas se adecúan a la preferencia del alelo con el que entrenamos el modelo y por lo tanto son buenos candidatos para testear en laboratorio si tienen la capacidad de despertar una respuesta inmune. La cantidad de péptidos que se pueden seleccionar dependerá de los recursos con los que dispongan. 

# PSI-BLAST

## Introducción
Psi-Blast es un algoritmo alternativo de BLAST que utiliza una matriz de puntajes posición específica para calcular el score de los alineamientos. Para calcular dicha matriz utiliza los hits que obtiene en cada iteración. De esta forma, la primer corrida es idéntica a un BLAST común, sin embargo, a partir de la segunda iteración los puntajes varían acorde a la conservación de cada posición permitiendo refinar la búsqueda y recuperando secuencias distantes que comparten motivos o dominios con nuestra secuencia query.

## Cuando BLAST falla

Digamos que tiene una secuencia query (abajo) y quiere predecir su estructura y función. Como vimos anteriormente uno recurre generalmente a BLAST para este tipo de tareas. Si logramos identificar una proteína suficientemente similar podríamos hipotetizar que comparten dichas caracteristicas.

```
>QUERY1
MKDTDLSTLLSIIRLTELKESKRNALLSLIFQLSVAYFIALVIVSRFVRYVNYITYNNLV
EFIIVLSLIMLIIVTDIFIKKYISKFSNILLETLNLKINSDNNFRREIINASKNHNDKNK
LYDLINKTFEKDNIEIKQLGLFIISSVINNFAYIILLSIGFILLNEVYSNLFSSRYTTIS
IFTLIVSYMLFIRNKIISSEEEEQIEYEKVATSYISSLINRILNTKFTENTTTIGQDKQL
YDSFKTPKIQYGAKVPVKLEEIKEVAKNIEHIPSKAYFVLLAESGLRPGELLNVSIENID
LKARIIWINKETQTKRAYFSFFSRKTAEFLEKVYLPAREEFIRANEKNIAKLAAANENQE
IDLEKWKAKLFPYKDDVLRRKIYEAMDRALGKRFELYALRRHFATYMQLKKVPPLAINIL
QGRVGPNEFRILKENYTVFTIEDLRKLYDEAGLVVLE
```

Vayan a la pagina de [BLAST](https://blast.ncbi.nlm.nih.gov/Blast.cgi) y utilicen el algoritmo de *protein BLAST* para buscar secuencias similares. **En el campo de base de datos seleccione pdb que es la base que contiene estructuras**

1. ¿Cuántos hits con E-value < 0.005 encuentra?

## Usando PSI-BLAST

> **NOTA:** Realicen cada corrida de BLAST (e iteración de PSI-BLAST) en una ventana diferente, en varios casos van a necesitar comparar las salidas.

Vuelvan atrás a la página de alineamiento de proteínas, pero esta vez seleccionen la base de datos (nr) y en la sección de algoritmos seleccionen PSI-BLAST.

Teniendo en cuenta que el primer hit es nuestro query y por lo tanto vamos a ignorarlo:
2. Ahora, ¿Cuántos hits significativos encuentra (E-value < 0.005)?
3. ¿Cuál es el coverage de estos hits?

## Construyendo la PSSM

Si se fijan debajo de los hits significativos van a tener la opción de seguir iterando PSI-BLAST:

![2iter](images/2iter.png)
 
Allí pueden especificar cuantas secuencias queremos utilizar para refinar nuestras PSSM (*Position-Specific Scoring Matrix*). Conservando el valor por defecto corramos la siguiente iteración.

4. ¿Cuántos hits significativos podemos encontrar ahora (E-value < 0.005)?
5. ¿Cómo se modificó el coverage de estos hits?
6. ¿Por qué cree que BLAST puede identificar ahora más hits significativos y que es lo que está afectando el coverage?

Antes de proseguir realice una o dos iteraciones más y observe la aparición de nuevas proteínas identificadas (marcadas con amarillo).

## Guardando y reutilizando la PSSM

Ahora podemos utilizar la PSSM que está ajustada con los resultados obtenidos de PSI-BLAST para realizar búsquedas más significativas en otras bases de datos.
Para obtener la PSSM descarguenla arriba donde dice "*Dowload All*"

![DownloadPSSM](images/DPSSM.png)

Volvamos una vez más a la página para realizar la búsqueda. Sin ingresar ninguna secuencia query seleccionemos otra vez la base de datos de estructuras (pdb) y como algoritmo PSI-BLAST. Por último, justo debajo del botón de BLAST, abramos el menú de *Algorithm parameters* y carguemos nuestra PSSM (justo al final). Ahora si corramos la búsqueda.

7. ¿Podemos encontrar hits significativos de PDB ahora?
8. ¿Qué función puede identificar en los primeros hits?

## Identificando residuos conservados

Ahora (sí tuvimos suerte) habremos podido identificar una relación estructural entre nuestra secuencia query secuencias de la base de datos de estructuras proteicas de PDB. Digamos que ahora nos gustaría validar esa relación y para ello vamos a llevar a cabo un ensayo en el cual mutaremos residuos esenciales en nuestra secuencia para probar si estos afectan su función (o estructura).

La secuencia de nuestra query es larga (más de 400 aminoácidos) y un estudio completo de mutación podría resultar extremadamente costoso. Por ello debemos tener especial cuidado en elegir posiciones que sean más probables de ser esenciales para la estructura y/o función de nuestra proteína.

Para esto vamos a utilizar lo que ya hemos hecho con PSI-BLAST y el programa [Blast2logo](http://www.cbs.dtu.dk/biotools/Blast2logo/) y vamos a seleccionar (guiados por la conservación de los residuos) 4 de los siguientes 8 residuos para llevar a cabo nuestro ensayo de mutagénesis:

* (a): H271
* (b): R287
* (c): E290
* (d): Y334
* (e): F371
* (f): R379
* (g): R400
* (h): Y436

Para identificar los residuos conservados vayan al servidor de [Blast2logo](http://www.cbs.dtu.dk/biotools/Blast2logo/) y suban la secuencia query. Seleccionen la base de datos NR70 y denle *submit* (esto puede llevar un tiempito). En caso de que algo falle puede encontrar la salida [acá](http://www.cbs.dtu.dk/biotools/Blast2logo/teaching/Query1/).

Cuando esto termine deberían tener un logo de toda la secuencia. Si les resulta difícil de leer pueden hacer click en el botón *Customize visualization using Seq2Logo*. Al hacer esto los transfiere al servidor de **Seq2logo**, allí, sin tocar ninguna opción denle submit. Arriba tienen la opción de descargar cada imagen por separado (JPEG(1), JPEG(2), etc.) o en un solo archivo, similar a PDF (EPS) en el cual van a poderlo ver mucho más claro (recomiendo esta ultima opción).

9. Viendo el logo: ¿Por qué cree que las primeras ~150 posiciones se ven bastante planas (Bits<1)?
10. ¿Cuáles cree que son los 4 residuos que podríamos mutar de la lista para generar un impacto en la función de nuestra proteína query?

## Modelado por homología

Para seguir acumulando pruebas de que nuestro ensayo realmente podría funcionar vamos a ver si las posiciones que seleccionamos podrían ser parte de su sitio activo. Para esto vamos a utilizar el servidor [CPHmodels](http://www.cbs.dtu.dk/services/CPHmodels/), el cual realiza modelado por homologia. Este programa toma como entrada una secuencia proteica, busca secuencias similares en PDB y utiliza una estructura para generar una aproximación a la estructura 3D de la secuencia query. Este proceso puede tardar entre 10 y 20 minutos asi que para ser prácticos, imaginen que corrieron el servidor y vayan a la salida [acá](http://www.cbs.dtu.dk/services/CPHmodels/teaching/query1.html).


La salida de CPHmodels no es muy intuitiva, sin embargo, el método provee un Z-score cuando el query y la proteína modelo tienen poca similitud de secuencia. Como regla general, un Z-score mayor a 10 significa que el modelo es confiable.

15. ¿CPHmodels concuerda con PSI-BLAST en su elección del modelo para obtener la estructura?

La estructura puede descargarse (desde el link *query.pdb*) y abrirse con programas que tengamos instalados. Pueden instalar Pymol utilizando el comando:

```Bash
sudo apt install pymol
```  
Este programa es muy versátil pero también puede resultar complejo de usar al principio. Pueden consultar la wiki de Pymol [acá](https://pymolwiki.org/index.php/Main_Page), donde van a encontrar tutoriales, scripts, comandos y demás. Por lo pronto, como aprender su uso puede llevar bastante tiempo y la clase es corta, aquí hay una visualización ya resuelta de la estructura en verde con los 4 residuos correctos en rojo:

![Model](images/CPHmodels.png)

16. ¿Podrían estos residuos ser parte del sitio activo?


