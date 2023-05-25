---

excerpt: All Pages
title: Sitemap

layout: default
---


{% assign pages_by_url = site.pages | sort: "url" %}
{% assign page_depth = 0 %}

{% for page in pages_by_url %}
    {% if page.title == nil %}
        {% continue %}
    {% endif %}
    {% assign page_parts = page.url | split: "/" %}
    {% if page_parts.size > page_depth %}
    {% assign page_depth = page_parts.size %}
<ul>
    {% endif %}       
    {% if page_parts.size < page_depth %}
    {% assign page_depth = page_parts.size %}
</ul>
    {% endif %}
<li>
<a href='{{page.url}}'>{{ page.title }}</a>
</li>      
{% endfor %}
