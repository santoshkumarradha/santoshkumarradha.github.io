---
layout: page
permalink: /publications/
title: Publications
description: Assorted list of publications, I may have left out some
years: [2022,2021,2020,2019,2018,2017]
---

{% for y in page.years %}
  <h3 class="year">{{y}}</h3>
  {% bibliography -f papers -q @*[year={{y}}]* %}
{% endfor %}
