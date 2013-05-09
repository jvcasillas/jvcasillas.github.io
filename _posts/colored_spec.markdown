---
published: true
status: publish
---
 
Title
========================================================
 
This is how I made the colored spectrogram from the homepage (it's me saying 'welcome'). You need to load the package phonTools into R.
 
 

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
