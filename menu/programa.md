---
layout: page
title: Informacion de la materia
permalink: info/
shortname: Info
---

## Docentes 

<div class="card-deck">
{% for d in site.data.docentes %}
<div class="col-6">
  <div class="card mb-3"> 
    <div class="card-body">
    <div class="row">      
        <div class="col-3"><img style="border-radius:50%" src="{{ '/' | relative_url }}assets/img/{{ d.img }}"></div>
        <div class="col-9">
            <h5 class="card-title"><a class="u-mail" href="mailto:{{ d.email }}" style="margin-right:10px"><i class="fas fa-envelope"></i></a>{{ d.add }} {{ d.name }}</h5>
            <p class="card-text"><small class="text-muted">{{ d.role }}</small></p>
        </div>
    </div>
    </div>
  </div>
</div>
{% endfor %}
</div>

## Programa Teórico

1. Experimentos Bioinformáticos
2. Bases de datos
3. Conceptos básicos de computación, algoritmos
4. Ontologías
5. Alineamientos de a pares, similitud
6. Alineamientos múltiples
7. Secuenciación y ensamblado de genomas
8. Preddicción de genes
9. Data clustering
10. Reconstrucción de filogenias
11. Información contenida en alineamientos múltiples
12. *Sequence profiles, Hidden Markov Models* (I y II)
13. Metodos de predicción basados en datos, machine learning
14. Quimioinformática

## Programa Práctico

{% assign ordered = site.pages | sort: 'lesson' %}
<ol>
{% for page in ordered %}    
    {% for pc in page.categories %}
      {% if pc == 'TP' %}                    
        <li><a href="{{ page.url | relative_url }}">{{ page.title }}</a></li>
      {% endif %}   <!-- cat-match-p -->
    {% endfor %}  <!-- page-category -->
{% endfor %}  <!-- page -->
</ol>
