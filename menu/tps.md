---
layout: page
title: Guías de Trabajos Prácticos
permalink: tps/
shortname: TPs
---
<div class="card-deck">

{% assign ordered = site.pages | sort: 'lesson' %}

{% for page in ordered %}    
    {% for pc in page.categories %}
      {% if pc == 'TP' %}        
        <div class="card mb-4" style="min-width:18rem; max-width:18rem">
          {% capture featured %}{{ page.url | relative_url | remove_first: 'README.html' }}{{ "/featured.jpg"}}{% endcapture %}
          <img class="card-img-top" src="{{ featured }}" alt="Card image cap">
          <div class="card-body">
            <h5 class="card-title">Lección #{{ page.lesson }}</h5>
            <p class="card-text"><a href="{{ page.url | relative_url }}">{{ page.title }}</a></p>
            <p class="card-text"><small class="text-muted">{{ page.description }}</small></p>
          </div>
        </div>
      {% endif %}   <!-- cat-match-p -->
    {% endfor %}  <!-- page-category -->
{% endfor %}  <!-- page -->
</div>
