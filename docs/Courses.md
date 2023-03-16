---
layout: default
---
<ul>
{% for course in site.data.courses %}
  <li>    
    {{ course.CourseName }}    
  </li>
{% endfor %}
</ul>