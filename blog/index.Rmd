---
framework: lanyon
layout: main
onefile: False
mode: selfcontained
url: {lib: ../libraries}
---


<div class="container content">
  <h2 class="extra">Blog Posts</br></h2>
  <div class="posts">
    {{# pages }}{{# date }}
    <ul class="post">
      <li><span><p class="posts">{{ date }} &raquo; <a href="../{{ link }}"> {{ title }}</a></p></span>
      </li>   
      <!-- {{ description }} -->
    </ul>
    {{/ date }}{{/ pages }}
  </div>

  <div id="home" align="justify">
    <h3 class="extra">Categories</br></h3>
    <ul>
      {{% for tag in site.tags %}}    
        <li><a href="./tags/{{ tag[0] }}">{{ tag[0] }}</a></li>
      {{% endfor %}}
    </ul>
  </div>
</div>
