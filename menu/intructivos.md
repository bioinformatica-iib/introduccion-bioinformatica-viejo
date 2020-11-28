---
layout: page
title: Instructivos
permalink: /intructivos/
shortname: Instructivos
---

<ul>
  {% for page in site.pages %}
      {% for pc in page.categories %}
        {% if pc == 'Instructivo' %}
          <li><a href="{{ page.url }}">{{ page.title }}</a></li>
        {% endif %}   <!-- cat-match-p -->
      {% endfor %}  <!-- page-category -->
  {% endfor %}  <!-- page -->
</ul>

