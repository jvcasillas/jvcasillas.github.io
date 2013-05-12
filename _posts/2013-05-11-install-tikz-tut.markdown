---
layout: post
title:  "Install tikzDevice in R"
date:   2013-05-11 14:52:18
categories: r latex
---

 
#### Overview
 
This is a short tutorial for getting tikzDevice running on R version 3.0.0. If you write in LaTeX and use R for statistics, this is a good way to get your plots/graphs/etc. into your .tex document. The advantages are (i) much higher quality and (ii) you can use IPA symbols. 

#### Download TiksDevice

TiksDevice is no longer officially supported by CRAN because the author () was having trouble keeping it updated in a timely manner. Nonetheless, the tikzdevice package is very usable and still available for download. 

Check out [this][why] webpage if you want to read a little more about the situation. If not, you can just download the file dirently by clicking [here][download].

#### Install TiksDevice

Installing a package that is no longer supported is by no means difficult, but not as simple as ```install.package('tikzDevice')``` (try it if you want to see why). Use the following code install the tar file (make sure to specify your file path to wherever you downloaded the file). This is what it looked like for me. 

    install.packages("/Users/USERNAME/Downloads/tikzDevice_0.6.2.tar", repos = NULL, type="source")

#### Install dependencies

In order for tikzdevice to work, we must also install the filehash package. This is much easier. 

    install.packages('filehash')

That's it. Check out [this][tikz-latex] tutorial to see how it works.

[why]: (http://cran.r-project.org/web/packages/tikzDevice/index.html)
[download]: (http://cran.r-project.org/src/contrib/Archive/tikzDevice/tikzDevice_0.6.2.tar.gz)
[tikz-latex]: (http://jvcasill.github.io/r-code/LaTeX/2013/05/11/ipa-rplot-tut.html)