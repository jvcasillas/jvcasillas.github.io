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
</div>
