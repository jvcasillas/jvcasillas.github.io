---
layout: post
title: "Colored spectrograms"
date: 2013-05-09 14:09:19
published: true
status: publish
categories: r-code
---

 
This is how I made the colored spectrogram from the homepage (it's me saying 'welcome'). This was done using the __phonTools__ package written by Santiago Barreda.
 

 
First, you need to load the package __phonTools__ into __R__.
 


    library(phonTools)

 
Now you have to load the sound you want to make a spectrogram of (it has to be in your working directory). I recorded mine in Praat.
 

    sound = loadsound("welcome.wav")

 
Now we're ready to make a spectrogram.
 

    spectrogram(sound, fs = 44100, gridlines = FALSE, colors = TRUE, maintitle = Welcome, 
        output = FALSE, zoom = FALSE, pause = FALSE)

![plot of chunk unnamed-chunk-3](/images/figure/unnamed-chunk-3.png) 

 
We can also see the oscillogram by using
 

    plot(sound)

![plot of chunk unnamed-chunk-4](/images/figure/unnamed-chunk-4.png) 

 
 
 
That's it.


<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'jvcasill'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>