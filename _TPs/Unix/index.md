---
layout: page
title: TP N°1
subtitle: Introducción a UNIX
data : False
menubar_toc: true
hero_height: is-small
toc_title: CONTENIDOS
---

{% if page.data %}

## Materiales

<a href="data/"> Descargar </a>

{% endif %}


## Objetivo

* Familiarizarse con el uso básico de los comandos de UNIX que más adelante nos permitirán sacar provecho de herramientas bioinformáticas, que solo se pueden utilizar de esta forma.

## Introducción

En este trabajo práctico vamos a aprender a usar la **LINEA DE COMANDO** (*o la consola, o el shell*). Para muchos de nosotros, que crecimos con la interfaz gráfica (GUI, por las siglas en ingles: *Graphic User Interface*) de sistemas operativos como los de Windows, la **LINEA DE COMANDO** puede parecer un desafío. Con práctica y algo de paciencia descubrirán que puede resultar amena. Y su uso tiene dos ventajas destacables para nuestro campo:
- Nos permitirá trabajar en entornos sin interfaz gráfica (GUI),
- Para los entornos que sí cuenten con interfaz gráfica, nos permitirá programatizar/automatizar procesos, acelerando el trabajo y minimizando la cantidad de errores que podemos cometer con tareas repetitivas.

Todo lo que hagamos en este TP se puede hacer directamente en el navegador, gracias a [Alex Morley](https://github.com/blahah/command_line_bootcamp) y colaboradores, que armaron una interfaz web especialmente diseñada para aprender lo básico de linea de comando: 

## Command-line bootcamp

Diríjanse al siguiente link: [Command-line Bootcamp](https://cli-boot.camp/). 

La guía cuenta en uno de los paneles que pueden ver en la web, con una consola que pueden usar para resolver todos los ejercicios de la misma. Sin embargo últimamente la consola no responde, por lo que vamos a resolver los ejercicios en la máquina virtual (VM) de la materia.
La VM, tiene Lubuntu como sistema operativo, y como en todo sistema Linux podemos abrir una nueva terminal para trabajar (y resolver todos los problemas de la guía) con: 

[CTRL]   [SHIFT] + [T]

 o yendo al menú desplegable que ven abajo a la izquierda --> “Herramientas del sistema” --> “LXterminal”

A medida que avancen con la guía, tengan en cuenta que al trabajar en la VM, algunos de los ejemplos de la guía pueden verse ligeramente distintos. Lo cual tiene sentido puesto que algunos ejercicios visualizan archivos y carpetas del sistema, como por ejemplo los primeros ejemplos que vemos en la sección 01 de la guía:

![Diferencias terminales](images/diferencias.png)

Donde pueden ver que:
- El *prompt* difiere, distinto usuario y equipo. (ver guía para entender qué es el prompt).

Esto se debe a que en efecto cada sistema tiene asignado un usuario distinto (learner en la guía y ibioinfo en la VM) y solo aparece el nombre del equipo en la VM (ibioinfo-VirtualBox).
- El comando `ls` al principio muestra carpetas diferentes; *a_directory* y *another_directory* en la guía y *Descargas*, *Escritorio*, *Música*, *Público*, etc en la VM.

Lo cual es esperable porque como ya se mencionó anteriormente, cada sistema tiene distintas carpetas y archivos.
- El contenido se visualiza con colores en la VM.

Esto se debe a que cada terminal de UNIX se puede configurar para visualizar el contenido de distintas formas; desde no colorear nada (como en la guía) o colorear según se trate de una carpeta, archivo, enlace suave, etc.

**Para quienes NO pudieron instalar la VM**
Pueden usar una terminal de unix online de [JSLinux](https://bellard.org/jslinux/vm.html?url=alpine-x86.cfg&mem=192)

> The bootcamp tutorial text was adapted from the original by Keith Bradnam. The infrastructure, including adventure-time and docker-browser-server, was built by @maxogden and @mafintosh. The setup of this app was based on the get-dat adventure. This adventure was made by Richard Smith-Unna. This work is licensed under a Creative Commons 4.0 International License. Creative Commons License
