---
layout: page
title: Descargas
permalink: descargas/
shortname: Descargas
---

<ul>
  {% for page in site.pages %}
      {% for pc in page.categories %}
        {% if pc == 'Descarga' %}
          <li><a href="{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
  {% endfor %}  <!-- page -->
</ul>

