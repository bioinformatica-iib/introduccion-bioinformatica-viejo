---
layout: tp
title: Motivos Funcionales en proteínas
categories: TP
descargas : True
results : results
scripts : scripts
lesson: 10
---
# Motivos Lineales en Proteínas

#### Recursos a utilizar:
* Regex101 [https://regex101.com](https://regex101.com)
* UniProt  [http://www.uniprot.org/](http://www.uniprot.org/)
* ELM [http://elm.eu.org](http://elm.eu.org)


### Ejercicio 1. Familiarizándonos con las Expresiones Regulares

#### Objetivos:
* Familiarizarse con la simbología utilizada en expresiones regulares
* Utilizar la simbología para poder realizar búsquedas basadas en texto
 
La simbología comúnmente utilizada en expresiones regulares es:

| Sı́mbolo | Definición |
|:---: | :---: |
| . | Cualquier aminoácido es permitido |
| [XY] | Solo los aminoácidos X e Y son permitidos |
| [^XY] | Los aminoácidos X e Y están prohibidos |
| {min,max} | Número mı́nimo y máximo de veces que se puede repetir una posición |
| ^X | El aminoácido X se encuentra en el extremo N-terminal |
| X$ | El aminoácido X se encuentra en el extremo C-terminal |
| (AB)\|(CD) | Se encuentran, o bien, los aminoácidos AB, o bien, los aminoácidos CD |


Estos símbolos nos permiten definir patrones que son observados en proteínas naturales para luego identificarlos en otras proteínas y ser puestos a prueba experimentalmente.
 
Los receptores nucleares interactúan con diversas proteínas mediantes un motivo lineal llamado NRBox (*Nuclear Receptor Box*) (Heery,1997). Existen numerosas estructuras de péptidos unidos a diferentes receptores nucleares (PDBs: 3CS8, 2GPO, 1GWQ, 1RJK, 1M2Z) que permitieron estudiar y entender algunas características de la interacción.

La evidencia experimental recolectada de la literatura indica que:
* El motivo NRBox forma una hélice alfa
* Existen tres leucinas que **se encuentran en una misma cara de la hélice** que interactúan con un bolsillo hidrofóbico en la superficie del receptor nuclear (Figura 1).

<img src="./images/NRBox.png" width=500>
 
**Figura 1.** Fragmento de la proteína PGC-1 alfa unido al receptor nuclear PPAR-gamma. Se muestra en naranja el backbone de la proteína representado en *Cartoon* y en azul las tres leucinas que median la interacción representadas en *Sticks* (PDB:3CS8) y que conforman el motivo NRBox.

Los siguientes fragmentos de secuencia corresponden a regiones de distintas proteínas que interactúan con diversos receptores nucleares y cuya interacción se verificó de manera experimental por distintos métodos.

``` 
>sp|Q15648|MED1_HUMAN|644-650
SMAGNTKNHPMLMNLLKDNPAQDFSTL
>sp|O43593|HAIR_HUMAN|565-571
AKHLLSGLGDRLCRLLRREREALAWAQ
>sp|Q16881-4|TRXR1_HUMAN|46-52
GPTLKAYQEGRLQKLLKMNGPEDLPKS
>sp|P48552|NRIP1_HUMAN|500-506
DVHQDSIVLTYLEGLLMHQAAGGSGTA
>sp|Q9UQ80|PA2G4_HUMAN|353-359
YKSEMEVQDAELKALLQSSASRKTQKK 
>sp|Q90ZL7|Q90ZL7_DANRE|69-75
VQHADGEKSNVLRKLLKRANSYEDAVM
>sp|Q9UBK2|PRGC1_HUMAN|143-149
PPPQEAEEPSLLKKLLLAPANTQLSYN 
>sp|Q9JL19|NCOA6_MOUSE|1494-1500
MSPAMREAPTSLSQLLDNSGAPNVTIK
>sp|Q15596|NCOA2_HUMAN|689-695
HGTSLKEKHKILHRLLQDSSSPVDLAK
>sp|Q92793|CBP_HUMAN|69-75
LVPDAASKHKQLSELLRGGSGSSINPG
```

1. Copie y pegue las secuencias en el recuadro de Test String en regex101 [https://regex101.com](https://regex101.com) y pruebe encontrar una expresión regular que permita identificar el motivo que media la interacción de estas proteínas con los receptores nucleares y que cumpla con la evidencia experimental observada.
2. Considerando que el motivo se encuentra en una hélice, ¿modificaría la expresión regular que obtuvo?

### Ejercicio 2. Base de datos de motivos lineales en Eucariotas (ELMdb)
La base de datos ELM (*Eukaryotic Linear Motifs*) es una base de datos que se enfoca principalmente en la anotación y detección de motivos lineales (MLs). Para ello cuenta con un repositorio de motivos manualmente anotados, por lo cual está altamente curada y una herramienta de predicción de motivos. Esta predicción de motivos se realiza mediante una búsqueda de patrones de secuencia basada en texto utilizando expresiones regulares.
 
1. Busque en ELM [http://elm.eu.org](http://elm.eu.org) en la pestaña Prediction una de las proteínas de la lista que usamos en el **Ejercicio 1**: la proteína PGC-1-alpha utilizando el accession number o uniprot ID (Q9UBK2 - PRGC1_HUMAN). Para cada motivo encontrado, se indica con símbolos (descriptos en la parte superior de la página) si la instancia del motivo es predicha o fue identificada experimentalmente (anotadas o "True Positives"). Responda: 
* ¿Encuentra el motivo NRBox entre los *True positives*?
* ¿Cuántas instancias *True Positive* existen?
* ¿Cómo es la estructura de la proteína donde se encuentran estos motivos?

2. Pegue y copie la siguiente secuencia en ELM y utilice los parámetros que se indican a continuación.

    ```
    >P04637
    MEEPQSDPSVEPPLSQETFSDLWKLLPENNVLSPLPSQAMDDLMLSPDDI  
    EQWFTEDPGPDEAPRMPEAAPPVAPAPAAPTPAAPAPAPSWPLSSSVPSQ  
    KTYQGSYGFRLGFLHSGTAKSVTCTYSPALNKMFCQLAKTCPVQLWVDST  
    PPPGTRVRAMAIYKQSQHMTEVVRRCPHHERCSDSDGLAPPQHLIRVEGN  
    LRVEYLDDRNTFRHSVVVPYEPPEVGSDCTTIHYNYMCNSSCMGGMNRRP  
    ILTIITLEDSSGNLLGRNSFEVRVCACPGRDRRTEEENLRKKGEPHHELP  
    PGSTKRALPNNTSSSPQPKKKPLDGEYFTLQIRGRERFEMFRELNEALEL  
    KDAQAGKEPGGSRAHSSHLKSKKGQSTSRHKKLMFKTEGPDSD
    ```
    
    Modifique los valores de los distintos parámetros de la siguiente manera:  

    **Cell Compartment:** Not specified  
    **Motif Probability Cutoff:** 100  
    **Taxonomic context:** (leave blank)  
 
* ¿Cuántas instancias predichas de motivos se encuentran?  
* ¿Qué se puede decir sobre la estructura de la proteína? ¿Se observa algún dominio? ¿Se observan regiones desordenadas?  
* ¿Los predictores estructurales y filtros (SMART, GlobPlot, IUPRED, Secondary Structure) coinciden sobre qué regiones son estructuradas/desordenadas?

3. Vaya de nuevo a la pestaña de predicción. Limpie el formulario con el botón *Reset Form*. Ingrese el accession number (P04637).
* ¿Qué proteína es?
* ¿Qué compartimentos celulares se le asignaron? ¿Tienen sentido?
* Realice la predicción y conteste: ¿Cuántas instancias de motivos se encuentran ahora?

4. Vaya de nuevo a la pestaña de predicción. Limpie el formulario con el botón *Reset Form*. Ingrese el accession number (P04637) y modifique el parámetro:  

    **Motif Probability Cutoff:** 0.01

* ¿Cuántas instancias predichas de motivos se encuentran ahora?
* ¿Por qué cree que es útil usar la localización celular, el contexto taxonómico y el umbral de probabilidad del motivo?

5. ¿Cuántas instancias anotadas posee? Compare la ubicación de las instancias anotadas con la información estructural proveniente de IUPred.

6. Vuelva a modificar el parámetro: **Motif Probability Cutoff:** 100 o 0.1

* ¿Cuántas instancias de la clase MOD_CK1_1 se encontraron? ¿Cuál es la diferencia entre estas instancias?

7. ¿Cuántos degrons anotados hay en p53? ¿Cuál es la función de estos motivos?

8. ¿Existe algún sitio anotado CDK en p53?

9. ¿Existe algún sitio anotado DOC_CYCLIN_RXL_1? ¿Qué relación funcional existe entre este sitio y el sitio CDK?

10. Busque la proteína P53_MOUSE en ELM.
* ¿Existen instancias anotadas?
* ¿Existen instancias asignadas por homología? ¿A qué organismo pertenecen?

### Ejercicio 3. Identificación de motivos cortos de interacción en p53 en un alineamiento propio.
La región amino terminal de p53 posee un motivo de unión a la E3 ligasa MDM2, el cual está caracterizado por una secuencia conservada que puede representarse por una expresión regular.

1. Entre en la base de datos ELM y busque la expresión regular del motivo con el ID: DEG_MDM2_SWIB_1. Para esto ingrese el ID en la parte superior derecha donde dice: Search ELM database. La expresión regular se encuentra marcada como *"Pattern"*. A continuación, busque las ocurrencias de esta expresión regular en las secuencias de p53. Para ello, abra en **Jalview** el alineamiento de p53 con el cuál estuvo trabajando en la clase de *Regiones Flexibles*. **Jalview** permite la búsqueda de motivos por expresiones regulares. Para hacerlo, utilice la función:

    *Select* → *Find*

    En la ventana tipee la expresión regular. Si este procedimiento falla, y tiene la ventana de las secuencias no alineadas abiertas, ciérrela. Si aún así falla, identifique el motivo utilizando el filtro de conservación.

* ¿Todas las secuencias de p53 tienen el motivo de interacción con MDM2?
* ¿Todos los motivos MDM2 tienen la misma longitud de secuencia?
* ¿Qué nivel de identidad de secuencia observa en esta región? ¿A qué puede deberse?

## Ejercicios Adicionales

### Ejercicio adicional 1. Un poquito más de expresiones regulares
La reparación del ADN durante la replicación ocurre por un proceso llamado Translesion synthesis (TLS). En este proceso, una polimerasa TLS, inserta un nucleótido en la lesión del ADN y luego, una polimerasa de la familia B extiende el templado. La acción coordinada de estas polimerasas, se logra por la interacción de proteínas scaffold como PCNA (*Proliferating  Cell Nuclear Antigen*) y la polimerasa TLS Rev1.
 
Existen estructuras cristalográficas de distintos péptidos unidos a Rev1 (PDBs: 2N1G, 2LSK, 2LSJ, 4FJO, 2LSI y 4GK5) que permiten entender algunas características de la interacción.
 
La evidencia experimental recolectada de la literatura indica:
* La interacción está mediada principalmente por dos residuos consecutivos de fenilalanina (Ohashi,2009).
Las fenilaninas interactúan con un bolsillo hidrofóbico en la superficie de Rev1 (Pozhidaeva, 2012; Zhao,2017).
* Las fenilalaninas se encuentran en el primer giro de una hélice α.
* Se requieren al menos 4 residuos posteriores a las fenilalaninas que formen parte de una hélice (Ohashi, 2009)
* El resto de la región de interacción se pliega formando hélices α de longitud variable (Pustovalova, 2016)
* En general se observan residuos cargados positivamente en la 2da y/o 3ra posición luego de las fenilalaninas que median interacciones electrostáticas con una superficie acídica de Rev1. Aunque la posición de estos residuos puede variar.
 
Los siguientes fragmentos de secuencia corresponden a regiones de distintas proteínas que participan en la reparación del ADN y que se unen la proteína Rev1. La interacción se verificó de manera experimental por distintos métodos.

``` 
>sp|Q03834|MSH6_YEAST|31-38
SQKKMKQSSLLSFFSKQVPSGTPSKKVQ
>sp|Q04049|POLH_YEAST|625-632
KKQVTSSKNILSFFTRKK   
>sp|Q60596|XRCC1_MOUSE|191-200
DDSANSLKPGALFFSRINKTSSASTSDPAG
>sp|Q9H040|SPRTN_HUMAN|418-428
RPRLEDKTVFDNFFIKKEQIKSSGNDPKYST
>sp|Q15054|DPOD3_HUMAN|236-245
NKAPGKGNMMSNFFGKAAMNKFKVNLDSEQ
>sp|Q9UNA4|POLI_HUMAN|569-579
SCPLHASRGVLSFFSKKQMQDIPINPRDHLS
>sp|Q9Y253|POLH_HUMAN|481-490
TATKKATTSLESFFQKAAERQK VK EA SL SS 
>sp|Q9Y253|POLH_HUMAN|529-539
PFQTSQSTGTEPFFKQKSLLLKQKQLNNSSV
>sp|Q9QUG2|POLK_MOUSE|564-575
LAKPLEMSHKKSFFDKKRSERISNCQDTSRCK
>sp|Q9UBT6|POLK_HUMAN|565-576
FVKPLEMSHKKSFFDKKRSERKWSHQDTFKCE
```

1. Copie y pegue las secuencias en el recuadro de Test String en regex101 y prueba encontrar una expresión regular que permita identificar el motivo que media la interacción de estas proteínas con Rev1 y que cumpla con la evidencia experimental observada.
2. Busque en ELM alguna de las proteínas. ¿Tu expresión regular difiere mucho de la propuesta por ELM?
3. SlimSearch es una herramienta que utilizando expresiones regulares permite buscar la presencia de motivos en las proteína almacenadas en Uniprot.
Vaya a la web de SlimSearch (http://slim.ucd.ie/slimsearch/) e ingrese la expresión regular del motivo como figura en ELM.
* ¿Cuántas proteínas obtuviste?
* ¿Cuál es la localización celular de Rev1 (Q9UBZ9)? Explore la lista de proteínas. ¿Hay alguna que no tenga la misma localización?
* Encuentre en la lista la proteína Kinesin-like protein KIF11 (P52732). ¿Cuál es su localización? 
ProViz es una herramienta que colecta y muestra información desde distintas fuentes facilitando la detección de motivos lineales.
4. Ingrese en el servidor de Proviz y busque la proteína Kinesin-like protein KIF11 (KIF11) (P52732). Ubique la región donde se encuentra el posible motivo sugerido por SlimSearch. ¿Está conservado? ¿A qué se debe esa conservación? ¿Te parece que es un posible motivo?

### Ejercicio Adicional 2. Familiarizándose con la base de datos ELM.
1. Realice la búsqueda de la secuencia de la proteína Paxillina (P49023) en ELM, utilizando los parámetros por defecto. Compare los resultados con una búsqueda de la misma secuencia pero modificando el parámetro cellular compartment *plasma membrane*.
2. Busque la proteína SRC_MOUSE (P05480) en ELM.
* ¿Existen instancias anotadas?
* Si no, ¿cuál es la instancia anotada más cercana que se puede encontrar?. Investigue de dónde proviene esta información.
3. Busque en ELM la proteína MDM4_HUMAN y encuentre el motivo de unión a USP (DOC_USP7_MATH_1). ¿Cuántas instancias del motivo se encuentran en esta secuencia?
4. Busque en ELM la proteína AMPH_HUMAN y encuentre la clase LIG_Clathr_ClatBox_1.
* ¿Cuál es la relevancia biológica de cada una de estas instancias?
* ¿La anotación de la relevancia biológica coincide con la estructura globular?
5. Busque todas las instancias anotadas para *Homo sapiens* que contienen el término *cilium* (pista: Usa http://elm.eu.org/elms/browse_instances.html).
* ¿Cuántas instancias hay?
* ¿Qué evidencia experimental está anotada y cuán confiable es esta evidencia?
 
6. Busque todas las instancias anotadas que contienen el término ”retinoblastoma” (Pista: usa http://elm.eu.org/elms/browse_instances.html)
* Compare el número de instancias humanas con el número de instancias virales.
* ¿Por qué hay tantas proteínas virales que interactúan con retinoblastoma? (Pista: La respuesta está en el abstract de la clase del motivo LIG_Rb_LxCxE_1)

### Ejercicio Adicional 3. Motivos lineales en proteínas virales
#### Objetivos:
* Familiarizarse con la herramienta de predicción de motivos de ELM.
* Aplicar la herramienta de predicción de motivos de ELM a una proteína viral.
 
La familia viral Adenoviridae (adenovirus) son virus ADNdc desnudos. Los adenovirus que infectan a humanos son responsables de muchas enfermedades respiratorias y de numerosos casos de gastroenteritis en niños. El único género de adenovirus que posee la proteína E1A es el género *Mastadenovirus* que infecta a **mamíferos**. Hasta la fecha, no existe ningún homólogo reportado en los restantes géneros de esta familia viral. La proteína E1A posee un rol importante en la replicación del genoma viral ya que desregula el ciclo celular induciendo la división celular. Esta estimulación de la progresión de la fase G1 a la fase S, permite que el virus use la maquinaria celular de replicación del ADN para replicar su propio genoma. Una vez expresada la proteína E1A su localización en la célula infectada es **nuclear** y minoritariamente **citosólica**.
 
1. Busque en ELM (http://elm.eu.org ) en la pestaña Prediction la proteína E1A del virus Human adenovirus 5 (E1A_ADE05). Utilice los siguientes parámetros:  

    **Cell Compartment:** Not specified  
    **Motif Probability Cutoff:** 100  
    **Taxonomic context:** (leave blank)  
 
* ¿Cuántas clases y cuántas instancias de motivos encuentras?
* En base a los conocimientos que poseemos de E1A_ADE05 modifique los parámetros **Cell Compartment** (se puede seleccionar más de un compartimento celular utilizando la tecla ctrl) y **taxonomic context**. ¿Cómo cambia el número de motivos encontrados?
* ¿Qué otros filtros observa que está utilizando ELM? ¿Por qué se le ocurre que se eligen automáticamente esos filtros?
* ¿Qué se puede decir de la estructura de la proteína E1A? ¿Se observa algún dominio? ¿Se observan regiones desordenadas?
* En cada una de las clases de motivos encontrados, se indica con distintos símbolos (descriptos en la parte superior de la página) si la instancia del motivo es predicha o fue identificada experimentalmente (instancias anotadas o *True Positives*). ¿Cuantas instancias anotadas existen?
* E1A tiene dos motivos de interacción con la proteína Retinoblastoma, un regulador del ciclo celular (motivo AB_groove y motivo LxCxE). Explore la clase LIG_Rb_LxCxE_1, para esto haga click sobre el nombre de la misma, en la lista de la izquierda. Se abrirá la página correspondiente a esa clase donde se listan todas las instancias reportadas en la literatura que están anotadas en ELM.
    * ¿En qué tipos de proteínas se encuentra el motivo LxCxE?
    * Existen dos tipos de instancias.

**True Positives (TP):** Son instancias identificadas por la expresión regular y que la evidencia experimental muestra que es funcional.  
**False Positives (FP):** Son instancias identificadas por la expresión regular, que la evidencia experimental sugieren que son funcionales, pero cuando fue evaluada se cree que no es realmente funcional.  
* ¿Se te ocurre algún ejemplo donde esto pueda ocurrir?

2. Busque en ELM E1A_ADECR.
* ¿Cuál es el contexto taxonómico?
* ¿Cuántas instancias anotadas hay? ¿Se encuentran los motivos anotados de E1A_ADE05? ¿A qué puede deberse?

3. La proteína Retinoblastoma (Rb) controla la transición en el ciclo celular de la fase G1 a la fase S mediante la interacción con factores de transcripción de la familia E2F.
* Vaya a ProViz (http://proviz.ucd.ie/) y busque la proteína E2F1_HUMAN (Q01094).
* ¿Puede identificar el motivo de interacción con Rb? (Pista: Hay una línea a la izquierda que se llama ELM).
* El motivo ¿Está en un contexto estructural desordenado? ¿Se encuentra conservado? ¿Es el mismo motivo usado por la proteína E1A para interactuar con Rb?
* ¿Qué otros motivos identifica? ¿Algunos de estos motivos están involucrados en el ciclo celular?

### Ejercicio Adicional 4. Motivos lineales en la Proteína CagA de Helicobacter pylori.
La infección por H. pylori puede causar gastritis, úlcera péptica o cáncer de estómago. Hay una mayor probabilidad de desarrollar cáncer estomacal si la infección es producida por una cepa del Este asiático (como F32) en comparación a una cepa del Oeste (como NCTC 11637). Estas cepas difieren en el número y contexto de secuencia de los motivos EPIYA (Higashi, H., et al., 2002; Jones, K.R., et al., 2009).
 
* Copie y pegue en ELM las secuencias la proteína CagA de una cepa del Oeste y una cepa del Este asiático, especificando *Cytosol* como **compartimento celular**, *Homo sapiens* como **contexto taxonómico** y un **umbral de corte de la probabilidad del motivo** de 0.001.

``` 
> NCTC11637_CagA
MTNETIDQQPQTEAAFNPQQFINNLQVAFLKVDNAVASYDPDQKPIVDKNDRDN  
RQAFDGISQLREEYSNKAIKNPTKKNQYFSDFINKSNDLINKDNLIDIGSSIKS  
FQKFGTQRYRIFTSWVSHQNDPSKINTRSIRNFMENIIQPPIPDDKEKAEFLKS  
AKQSFAGIIIGNQIRTDQKFMGVFDEFLKERQEAEKNGEPTGGDWLDIFLSFVF  
NKEQSSDVKEAINQEPVPHVQPDIATTTTHIQGLPPESRDLLDERGNFSKFTLG  
DMEMLDVEGVADIDPNYKFNQLLIHNNALSSVLMGSHNGIEPEKVSLLYAGNGG  
FGAKHDWNATVGYKNQQGDNVATLINVHMKNGSGLVIAGGEKGINNPSFCLYKE  
DQLTGSQRALSQEEIRNKIDFMEFLAQNNAKLDNLSEKEKEKFQNEIEDFQKDS  
KAYLDALGNDRIAFVSKKDPKHSALITEFGKGDLSYTLKDYGKKADRALDREKN  
VTLQGNLKHDSVMFVNYSNFKYTNASKSPDKGVGVTNGVSHLDAGFSKVAVFNL  
PDLNNLAITSFVRRNLENKLVTEGLSLQEANKLIKDFLSSNKELVGKALNFNKA  
VADAKNTGNYDEVKKAQKDLEKSLRKREHLEKEVEKKLESKSGNKNKMEAKAQA  
NSQKDKIFALINKEANRDARAIAYSQNLKGIKRELSDKLEKINKDLKDFSKSFD  
EFKNGKNKDFSKAEETLKALKGSVKDLGINPEWISKVENLNAALNEFKNGKNKD  
FSKVTQAKSDLENSVKDVIVNQKITDKVDNLNQAVSMAKATGDFSRVEQALADL  
KNFSKEQLAQQTQKNESFNVGKKSEIYQSVKNGVNGTLVGNGLSGIEATALAKN  
FSDIKKELNEKFKNFNNNNNNGLENEPIYAKVNKKKTGQVASPEEPIYAQVAKK  
VNAKIDRLNQAASGLGGVGQAGFPLKRHDKVDDLSKVGRSVSPEPIYATIDDLG  
GPFPLKRHDKVDDLSKVGRSVSPEPIYATIDDLGGPFPLKRHDKVDDLSKVGRS  
VSPEPIYATIDDLGGPFPLKRHDKVDDLSKVGLSRNQELAQKIDNLSQAVSEAK  
AGFFSNLEQTIDKLKDSTKYNSVNLWVESAKKVPASLSAKLDNYATNSHTRINS  
NIQNGAINEKATGMLTQKNPEWLKLVNDKIVAHNVGSVPLSEYDKIGFNQKNMK  
DYSDSFKFSTKLNNAVKDVKSSFTQFLANAFSTGYYSLARENAEHGIKNVNTKG  
GFQKS
```
``` 
> F32_CagA
MTNETIDQTTTPDQTGFVPQRFINNLQVAFIKVDNAVASFDPDQKPIVDKNDKD  
NRQAYEKISQLREEYANKAIKNPAKKNQYFSDFINKSNDLINKDNLIAVDSSVE  
SFRKFGDQRYQIFTSWVSLQKDPSKINTQQIRNFMENVIKPPISDDKEKAEFLR  
SAKQSFAGIIIGNQIRSDEKFMGVFDESLKARQEAEKNAEPAGGDWLDIFLSFV  
FNKKQSSDLKETLNQEPRPDFEQNLATTTTDIQGLPPEARDLLDERGNFFKFTL  
GDVEMLDVEGVADKDPNYKFNQLLIHNNALSSMLMGSHSNIEPEKVSLLYGDNG  
GPEARHDWNATVGYKNQQGNNVATLINAHLNNGSGLIIAGNEDGIKNPSFYLYK  
EDQLTGLKQALSQEEIQNKVDFMEFLAQNNAKLDNLSEKEKEKFQTEIENFQKD  
RKAYLDALGNDHIAFVSKKDPKHLALVTEFGNGELSYTLKDYGKKQDKALDGET  
KTTLQGSLKYDGVMFVNYSNFKYTNASKSPNKGLGTTNGVSHLEANFSKVAVFN  
LPNLNNLAITNYIRRDLEDKLWAKGLSPQEANKLIKDFLNSNKEMVGKVSNFNK  
AVAEAKNTGNYDEVKKAQKDLEKSLRKREHLEKEVAKKLESRNDNKNRMEAKAQ  
ANSQKDKIFALISQEASKEARVATFDPYLKGVRSELSDKLENINKNLKDFGKSF  
DELKSGKNNDFSKAEETLKALKDSVKDLGINPEWISKIENLNAALNDFKNGKNK  
DFSKVTQAKSDLENSIKDVIINQKITDKVDNLNQAVSEIKLTGDFSKVEQALAE  
LKNLSLDLGKNSDLQKSVKNGVNGTLVSNGLSKTEATTLTKNFSDIRKELNEKL  
FGNSNNNNNGLKNNTEPIYAQVNKKKTGQATSPEEPIYAQVAKKVSAKIDQLNE  
ATSAINRKIDRINKIASAGKGVGGFSGAGRSASPEPIYATIDFDEANQAGFPLR  
RSAAVNDLSKVGLSREQELTRRIGDLSQAVSEAKTGHFGNLEQKIDELKDSTKK  
NALKLWVESAKQVPTSLQAKLDNYATNSHTRINSNVQSGTINEKATGMLTQKNP  
EWLKLVNDKIVAHNVGSAPLSAYDKIGFNQKNMKDYSDSFKFSTKLNNAVKDIK  
SSFVQFLTNTFSTGSYSLMKANVEHGVKNTNTKGGFQKS
```

1. ¿Cuáles son las diferencias en las predicciones del motivo EPIYA?
2. ¿Existen diferencias en la asignación por homología?

### Ejercicio Adicional 5. Usando JalView con la proteína TIR aislada de E. coli patogénica
Las proteínas TIR son secretadas por la cepa patogénica de E. coli y se asocian a ciertas células de mamíferos, proyectando sus extremos N- y C-terminal a través de la membrana plasmática hacia la parte interior de la célula huésped tomando el control de la regulación celular local, por ejemplo induciendo junto con otras proteínas la formación de un pedestal de actina esencial para el ciclo patogénico de esta bacteria. La porción central de la proteína TIR permanece en el compartimiento extracelular y se asocia a la bacteria. Existen numerosas secuencias de TIR obtenidas de diferentes aislamientos de *E. coli* patogénica almacenadas en la base de datos UNIPROT.

1. Cargue el alineamiento de proteínas TIR que se encuentra en la carpeta MSA del TP de la materia (tir_aligned.fasta) en la ventana de JalView.
2. La expresión regular del motivo de unión a Ciclina es:  
```[RK].L.{0,1}[FLMP]```  
La expresión regular del motivo de fosforilación por CDK (quinasa dependiente de ciclina) es:  
```[ST]P.{0,2}[RK]```  
La fosforilación de proteínas durante el ciclo celular es realizada por complejos Ciclina-CDK, y requiere la presencia de ambos motivos en la proteína a ser fosforilada.  
Utilice las expresiones regulares para encontrar estos motivos en las secuencias. Para poder resaltarlas, en la ventana donde ingresó la expresión regular cliquee en *New Feature*. Ahí puede crear un grupo y seleccionar un color para el mismo.
* ¿Todas las secuencias tienen ambos motivos? 
* ¿Los distintos ejemplos de motivos están alineados o se encuentran en lugares diferentes de la secuencia?
* Algunos motivos están yuxtapuestos ¿considera que pueden ser los dos funcionales al mismo tiempo?
3. Existe evidencia que el ciclo celular puede ser interrumpido por la cepa patogénica de E. coli (PMID: 11598051).   
El dominio SH2 une un motivo que posee una tirosina fosforilada. Busque el motivo SH2 utilizando la expresión regular del motivo SH2:  
```Y..[IVLM]```  
* ¿Todas las secuencias tienen motivos SH2?
* ¿En base a tu respuesta anterior, espera que las proteínas TIR sean o no fosforiladas por tirosin quinasas dentro de la célula?

### Ejercicio Adicional 6. Usando JalView con la proteína CagA aislada de la cepa Helicobacter patogénica
Las proteínas efectoras CagA son secretadas por la cepa patogénica de Helicobacter ingresando directamente al citoplasma de la célula huésped, en parte utilizando un motivo funcional llamado *motivo EPIYA*. Estas proteínas modulan el citoesqueleto de actina y el estado general de la célula.

1. Cargue el alineamiento de las proteínas CagA.(CagA_aligned.fasta).

    ``` bash
    wget https://raw.githubusercontent.com/trypanosomatics/introduccion-bioinformatica/master/TPs/Motivos_Lineales/data/CagA_aligned.fasta
    ```

    Busque el motivo EPIYA utilizando la expresión regular del motivo:  
```EP[IL]Y[TAG]```
* ¿Las secuencias de CagA: tienen un motivo EPIYA o más de uno?
* ¿Todas las secuencias tienen el mismo número?
* ¿Cuál es el mayor número de motivos EPIYA en una proteína?
* ¿Algún motivo EPIYA se superpone con algún motivo SH2?
* ¿Cree que las proteínas CagA son fosforiladas por tirosin-quinasas?
