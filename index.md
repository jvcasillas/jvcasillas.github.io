---
framework: lanyon
onefile: False
mode: selfcontained
---

<audio id="welcome">
    <source src="{{ page.url.framework }}/assets/sounds/welcome_robot.wav" type="audio/mpeg">
    <source src="{{ page.url.framework }}/assets/sounds/welcome_robot.ogg" type="audio/ogg">
</audio>


<div>
	<a href="#" onClick="document.getElementById('welcome').play(); return false;">
		<img width="100%" class="img-thumbnail" src="{{ page.url.framework }}/assets/images/praat.png" alt="welcome image">
	</a>
</div>





<style>
  .lead {
    margin-bottom: 20px;
    font-size: 1.1rem;
    font-weight: 200;
    line-height: 1.4;
    text-align: justify;
  }
</style>
