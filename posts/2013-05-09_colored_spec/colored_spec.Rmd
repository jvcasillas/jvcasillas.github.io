---
title: "Colored spectrograms in R"
date: "2013-05-09"
config: "../config.yml"
card: True
disqus: True
---

This is how I made the colored spectrogram from the homepage (it's me saying 'welcome'). You need to load the package phonTools into R.


	library(phonTools)


Now you have to load the sound you want to make a spectrogram of (it has to be in your working directory). I recorded mine in Praat.


    sound <- loadsound('welcome.wav')


Now we're ready to make a spectrogram.


    spectrogram(sound, fs=44100, colors=TRUE, maintitle= "Welcome", maxfreq=5500)


<img width="100%" src="assets/fig/unnamed-chunk-3.png">

We can also see the oscillogram by using


	plot(sound)


<img width="100%" src="assets/fig/unnamed-chunk-4.png">

That's it. 
