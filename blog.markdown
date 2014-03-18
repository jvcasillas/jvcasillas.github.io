---
layout: page
title: Blog
analytics : true
---

<div id="home" align="justify">
	<h2 class="extra">Blog Posts</br></h2>
	
	<ul class="posts">
	{% for post in site.posts %}
		<li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
	{% endfor %}
	</ul>


	<p></br>
	</br>
	</br>
	</p>

	<h3 class="extra">Categories</br></h3>
	<ul>
	    {% for tag in site.tags %}		
	        <li><a href="/tags/{{ tag[0] }}">{{ tag[0] }}</a></li>
	    {% endfor %}
	</ul>
</div>