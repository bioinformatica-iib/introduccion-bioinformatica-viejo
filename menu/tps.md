---
layout: page
title: Guías de Trabajos Prácticos
permalink: tps/
shortname: TPs
---
<ul>
  {% for page in site.pages %}    
      {% for pc in page.categories %}
        {% if pc == 'TP' %}
          <li><a href="{{ site.baseurl }}{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
  {% endfor %}  <!-- page -->
</ul>

