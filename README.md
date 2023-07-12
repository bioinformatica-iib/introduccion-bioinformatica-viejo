# Introducción a la Bioinformática - Sitio Viejo (hasta 2021)

Este repositorio está archivado. Corresponde a material de las cursadas hasta 2021.

## Para acceder al sitio:

Donde se hace el deploy:  
[Sitio Web Generado](https://bioinformatica-iib.github.io/introduccion-bioinformatica/)

## Para editar este sitio:

El sitio web está escrito en ruby+jekyll usando un theme que se llama bulma clean theme. Para hacer cosas muy locas ver la documentaación de cada cosa

- [Jekyll](https://jekyllrb.com/docs/)
- [Bulma](http://www.csrhymes.com/bulma-clean-theme/)

La web separa los contenidos en colecciones (carpetas que arrancan con ``_``). Las colecciones obvias son

- TPs
- Instructivos
- Teóricas

También hay carpetas no-colecciones como about.

La diferencia entre ambas es que las colecciones objetos iterables, y permiten hacer cosas como 

```
    {% for pagina in coleccion %}
        <h1> {{ pagina.title }}
    {% endfor }
```

No obstante, usar un template limita bastante lo que se puede hacer en términos de estilo, por lo que para esta implementación la diferencia entre colecciones y no-colecciones es meramente semántica. 

Lo que se muestra en el sitio está definido en distintos archivos de configuración que se encuentran en la carpeta `_data`

- `contents.yml`: Barra de contenidos que se muestra en el index
- `instructivos.yml`: Lista de instructivos
- `navigation.yml`: Menu de navegación en la barra superior
- `tps.yml`: Lista de TPs

Yo solo cargué algunas entries en cada árbol de contenidos, pero si siguen la estructura definida en esos archivos pueden extender fácilmente estos archivos y desplegar el contenido completo. 

## Lo importante en cada pieza de contenido

Todas las páginas son un archivo tipo markdown con un *frontmatter*, que si leyeron un poco la documentación es algo tipo

```
---
variable: valor
variable_2: otro valor
---
```

Algunas variables por defecto (permalink, title, slug, layout ... ) sirven a jekyll para hacer cosas, otros para el theme (ver docu de bulma) y otras que son custom, y que sirven para hacer lo que uno quiera dentro del markdown.

Por ejemplo, todos los ``index.md`` de las clases prácitcas tiene un par de los default (title, layout), uno de bulma (menubar_toc) y uno custom. Si se fijan, en estos archivos, ``data==True`` es condición para mostrar el link a la carpeta con descargables al principio del documento.

Otra variable importante en el frontmatter es el permalink, que permite customizar la ruta a la página. No obstante, todos los archivos son accesibles usando su path relativo como ruta. Ej: ``/introduccion-bioinformatica/TPs/Short-Read-Mapping``

## Lo que falta para tener un sitio piola

Les dejo una lista de cosas que faltan para tener un sitio piola y que por cuestiones de tiempo no puedo hacer yo mismo. Si tienen dudas, por supuesto pueden preguntar

1. Cambiar el flyer que se muestra la página principal: el mismo se linea desde index.md en la raíz del repo. Pueden usar el de inmunoinfo para guiarse.
2. Agregar contenido a las páginas del about: index.md tiene cosas sobre el programa, y schedule podría tener la agenda de la materia. Pueden aventurarse un poco más y crear una página más con les docentes
3. Cargar las teóricas: Duplicar lo que sea hace con los TPs y aprovechar la funcionalidad de las galerias para listar las teóricas del mismo modo. No se olvide de agregarlas a ``contents.yml``
4. Cargar el resto de los TPs tanto ene ``contents.yml`` como en ``tps.yml``
5. Agregar al index de la raíz las fechas y medios de inscripción.
