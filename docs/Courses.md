---

title: Courses

layout: default
---

---
layout: default
---

{% for course in site.data.courses %}
  <h2>    
    {{ course.CourseName }}
  </h2>

  <table>
    <tr>
      <th>Topic</th>
      <th>Level</th>
    </tr>
  {% for courseTopic in course.Topics %}
    <tr>
      <td><a href='/{{ courseTopic.Link}}'>{{courseTopic.TopicName}}</a></td>
      <td>{{courseTopic.Level}}</td>
    </tr>
  {% endfor %}  
  </table>
{% endfor %}
