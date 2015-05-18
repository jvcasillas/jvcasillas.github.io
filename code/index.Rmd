---
framework: lanyon
onefile: False
mode: selfcontained
url: {lib: ../libraries}
---

## Projects


{{# site.projects }}
<a href="{{url}}">
  <p>{{ title }}</p>
  <img width=100% style="border:1px solid black;" src=thumbnails/{{ thumbnail }}></img>
</a>
</br>
{{/ site.projects }}



