---
title: "Instructivo"
subtitle: "Puesta en funcionamiento de máquina virtual"
layout: page
hide_hero: false
hide_footer: true
menubar_toc: true
hero_height: is-small
toc_title: CONTENIDOS
---

Este es un instructivo corto sobre cómo hacer para correr la máquina virtual de la materia en sus compus sin tener que reinstalar el sistema operativo.

Vamos a necesitar:

**Software y archivos a descargar y/o instalar**
* El disco de la máquina virtual (VMDK)
* [Oracle VirtualBox](https://www.virtualbox.org/) instalado en nuestras compus.
* WinZip o GUnzip para Windows o Linux, respectivamente.

**Requerimientos de Hardware mínimos**
* **20 GB** de espacio libre en disco duro (para VMDK)
* **2 GB** de RAM. 


## Antes de arrancar veamos algunas definiciones 

### ¿Qué es un sistema operativo?

Un sistema operativo es una pieza de *software* que nos permite realizar funciones básicas, como copiar/pegar/mover/generar archivos, y sobre el cual se construyen otros softwares. Muchos sistemas operativos también proveen una interfaz gráfica que permite al usuario hacer tareas sin línea de comando (yay!). Hay un montón de sistemas operativos, pero los más comunes son Windows, OSX y Linux.

### ¿Qué es una máquina virtual?

Las máquinas virtuales no son más que compus *invitadas* (o *guests*), emuladas dentro de una computadora real, hospedadora (o *host*). Como las máquinas físicas, las máquinas virtuales corren un sistema operativo que permitirá hacer distintas cosas. La virtualización es un proceso costoso, desde el punto de vista de que nos permite crear nuevas compus pero, al momento de correrlas, estaremos repartiendo los recursos reales (espacio en disco, memoria RAM y velocidad de procesamiento CPU) del *host* entre todas las máquinas virtuales *guest* que estén activas. Es por esto que debemos ser cuidadosos al momento de generarlas, dándoles suficientes recursos para funcionar, pero no todos los recursos del *host*.

## El disco de máquina virtual

El disco de una máquina virtual es la “foto” de un disco de almacenamiento. Esto es: todo lo que un disco duro "virtual" tiene guardado, incluyendo el sistema operativo y los programas instalados, quedarán guardados en un archivo cuando la creemos con las herramientas adecuadas. Este archivo permite regenerar el estado de la computadora desde la que se creó dicho disco al momento de sacar la foto. 
Los docentes ya hemos ensamblado, para la materia, un disco de máquina virtual con Lubuntu 18 (una distribución versión ultra liviana de Ubuntu 18) en la que hemos instalado todos los programas y herramientas que usaremos en la asignatura. En adelante, nos referiremos a éste como IBioinfo.

## Paso 1. Descargar la Máquina Virtual
Pueden usar este link, que tiene la máquina que usamos en los TPs (es un link a Dropbox).
* [IBioinfo-Lubuntu-32.vmdk - DROPBOX](https://www.dropbox.com/s/mh71ia4kts0n5ht/IBioinfo-Lubuntu-32.zip?dl=0)

O este otro (link a Drive).
* [IBioinfo-Lubuntu-32.vmdk - DRIVE](https://drive.google.com/file/d/16zMi4nsLLwGqU4WNMvzdVs3n7ruXZoNX/view?usp=sharing)


Una vez descargado el archivo, descomprimir para obtener el vmdk.

> Notarán que son archivos pesados (~ 20GB). Descárguenlos con tiempo y con conexión estable. Si no cuentan con una conexión estable, pueden escribirnos para buscar alguna solución alternativa. 

## Paso 2. Instalar Virtual Box
Mientras descarga la imagen, aprovechen el tiempo muerto para descargar Oracle Virtual Box. El programa es gratuito y pueden descargarlo desde [la página oficial](https://www.virtualbox.org/). Descarguen la última versión (v6.1), apropiada para su sistema operativo (Windows, OSX o Linux) y sigan las instrucciones del instalador hasta que hayan terminado.

## Paso 3. Crear una máquina virtual
Virtual Box es un virtualizador de entornos. Nos permite generar *máquinas virtuales*. Vamos a crear nuestra máquina virtual con el archivo de disco virtual **IBioinfo-Lubuntu-32.vmdk** que acabamos de descargar. Para eso:

**1.** Abrimos Virtual Box:

![VM New](./images/vm00.png)

 **2.** Hacemos click en `New`

**3.** Aparecerá una caja de diálogo, en donde deberemos indicar:
* **Name o Nombre:** Es el nombre que queremos darle a la máquina virtual. Elijan el que quieran.
* **Machine Folder o Carpeta de Máquina:** Es la ubicación de la máquina virtual. Elijan la que quieran.
* **Type o Tipo:** Es el tipo de virtualización. Elijan Linux.
* **Version o Versión:** Es la versión del sistema operativo. Ubuntu 32 o 64 bits.

![VM1](./images/vm01.png)

**4.** En el mismo panel deberemos indicar la cantidad de memoria RAM que vamos a *prestarle* a la máquina virtual: Pongan la máxima que puedan dentro de la región verde (recuerden que al momento de usar la máquina virtual, ésta sustraerá automáticamente recursos de nuestra compu). 

Estos valores dependerán de la cantidad de RAM física que tenga nuestro *host*. Cuanto más RAM le demos a la máquina virtual, más rápido va a andar. Para las tareas que realizaremos, darle entre 2 y 4 GB de ram (2048-4096 MB) estará bien.

![VM2](./images/vm02.png)

**5.** Y finalmente el disco duro. Aquí es donde entra nuestro archivo **IBioinfo-Lubuntu.vmdk**:

![VM3](./images/vm03.png)
   
Haciendo click en el icono de la carpeta a la derecha, agregaremos nuestro disco virtual (Añadir > elegimos nuestro VMDK):

**6.** Con esto habremos finalizado la creación y podremos comenzar. Si todo salió bien, deberán ver una entrada con su máquina virtual recientemente creada en el Inicio del Virtual Box.

![VM4](./images/vm04.png)

**7.** Intenten correr la máquina virtual haciendo click en “Iniciar”. En breve deberían ver el logo de Lubuntu y pronto el escritorio del sistema operativo. 

## Importante
> * Si les pide alguna contraseña, la misma es **unsam**.
> * Una vez creada la Virtual Machine **NO** muevan el archivo .vmdk de lugar. Si lo hicieron, fíjense en la sección de problemas que está la solución.

## Problemas y Soluciones
### No funciona y eligieron la virtualización de 32 bits
**Solución:** Habilitar una opción de virtualización especial (PAN/NX), sobre todo en sistemas nuevos.
* Para hacerlo: Click derecho en la máquina virtual > Configuración > Sistema > Procesador > "Habilitar PAE/NX"

![ERROR1](./images/error1.png)

### Error: "This computer does not have hardware-assisted virtualization"
La computadora, por defecto, no permite la virtualización.

**Solución:** Sigan los pasos descritos en [este post](https://www.makeuseof.com/tag/virtualization-issues-simple-solutions/).

### En sistema aparece cartel que dice: *el hardware de virtualización está habilitado en la sección de aceleración de la página de Sistema...*

![ERROR2a](./images/error2a.png)

**Solución:** Accedan a la pestaña de "Aceleración" y asegúrense de que no haya ninguna interfaz de paravirtualización seleccionada.

![ERROR2b](./images/error2b.png)

### Error: "Could not open medium"

![ERROR3](./images/error3.png)

Es posible que hayan movido el archivo vmdk.

**Solución:** Vayan a Archivo > Biblioteca de Medios (Virtual media manager) y remuevan el disco problemático.

* Si la opción de remover les aparece deshabilitada, deberán “Liberarlo” primero. Luego, borren la máquina virtual y vuélvanla a crear usando la nueva (y **definitiva**) ubicación del archivo vmdk.

### Error: Kernel driver not installed (rc=-1908)
**Solución para máquina física/host con sistema operativo Ubuntu:** Abrir la terminal y correr los siguientes comandos:

```Bash
sudo dpkg-reconfigure virtualbox-dkms
sudo /sbin/vboxconfig
```
* Luego de esto, abrir nuevamente VirtualBox e iniciar la maquina virtual. El error se debería haber solucionado.

## Tips and Tricks para usar la VM más cómoda.

### Resolución de Pantalla
Por defecto, la resolución de la VM es 800x600. Si el monitor o pantalla nos da para agrandar un poco esto, acá les dejo los pasos para hacerlo:

**1.** Click en el Botón **inicio** de Lubuntu  (esquina inferior izquierda)

**2.** Click en **Preferencias**

**3.** Click en **Ajustes del monitor**

![TIP1A](./images/tip1a.png)

**4.** Pasar la resolución a la mayor posible (podemos usar la misma que usamos en el sistema operativo del host)

![TIP1B](./images/tip1b.png)

**5.** Click en **Aplicar** y, si estamos conformes, en **Guardar**.

**6.** Para que la resolución de pantalla elegida sea permanente:

Esta versión de lubuntu presenta un bug donde la resolución cambia cada vez que se suspende la VM. Por lo tanto la forma más sencilla de solucionarlo es configurando la VM para no suspenderse más:

**a.** Click en el Botón **inicio** de Lubuntu  (esquina inferior izquierda)

**b.** Click en **Preferencias**

**c.** Click en **Administrador de energía**

**d.** Click en la pestaña Pantalla y luego mover las tres barras hasta la izquierda como se muestra en la siguiente imagen:

![TIP2](./images/tip2.png)

**e.** Click en la pestaña Seguridad y luego seleccionar "Nunca" en la lista desplegable que aparece al lado de **Bloquear sesión automáticamente** y luego destildar donde dice "Bloquear la pantalla cuando el sistema vaya a suspensión". Tiene que quedar como se ve en la siguiente imagen:

![TIP3](./images/tip3.png)

### Maximizar la ventana.
Si maximizamos la ventana a "pantalla completa", será como estar usando la máquina virtual solamente. Esto para algunos puede resultar más cómodo. Pueden probarlo presionando las teclas **Ctrl derecho** + **F** juntas.

![TIP4](./images/tip4.png)

### Acceso a la línea de comandos
Para acceder a la línea de comandos hay tres formas:

* **Forma 1:** Inicio > Herramientas del sistema > LXTerminal
* **Forma 2:** Presionar las teclas **Ctrl izquierdo** + **Alt izquierdo** + **T**, las tres juntas.
* **Forma 3:** Presionando la tecla F4 en la carpeta donde nos encontremos.

### Cambiar el layout del teclado
Para cambiar el layout del teclado:

**1.** Click derecho en el panel:

![TIP4](./images/tip4.png)

**2.** Seleccionar Añadir/quitar elementos del panel

![TIP5](./images/tip5.png)

**3.**  Seleccionar Añadir -> Agente de distribución del teclado

![TIP6](./images/tip6.png)

**4.** Hacer click en Añadir, cerrar la ventana.

En el panel aparecerá al lado del botón de apagado la bandera española, click derecho sobre la bandera y seleccionar la primera opción: Configuración de **Agente de distribución de teclado**

![TIP7](./images/tip7.png)

**5.** Se abrirá una ventana. Destildar la opción: Mantener las distribuciones del sistema y se habilitarán las opciones:

![TIP8](./images/tip8.png)

**6.** En Distribuciones del teclado elegir Añadir y busca en la lista el teclado correspondiente.

Los más comunes son:

* Español (es)
* Español latinoamericano (latam)
* Inglés (EE.UU.) (us)

**Si no sabés cual es:** podés chequear algunos teclados en [Wiki](https://es.wikipedia.org/wiki/Distribuci%C3%B3n_del_teclado) en la sección QUERTY.

**7.** Selecciona el que corresponda y haz click en Aceptar. Volverá a la ventana anterior donde puedes subir la configuración que desees usar (o quitar la que no quieres usar).

![TIP9](./images/tip9.png)

**8.** Si dejaste más de una configuración, haciendo click sobre la banderita en el panel podés cambiar a las distintas configuraciones (va cambiando la etiqueta).
