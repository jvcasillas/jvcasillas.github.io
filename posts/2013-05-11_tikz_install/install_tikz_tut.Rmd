---
title: "TikzDevice tutorial part I: install tikzDevice in R"
date: "2013-05-11"
config: "../config.yml"
card: True
disqus: True
analytics : true
---

#### Overview

This is a short tutorial for getting __tikzDevice__ running on __R__ version 3.0. If you write in __LaTeX__ and use __R__ for statistics, this is a good way to get your plots/graphs/etc. into your .tex document. The advantages are:
1 - much higher quality and
2 - you can use IPA symbols

#### Download tiksDevice

__TiksDevice__ is no longer officially supported by CRAN because the author was having trouble keeping it updated in a timely manner (Check out [this][why] webpage if you want to read a little more about the situation). Nonetheless, the __tikzdevice__ package is very usable and still available for download. You can download the tar.gz file directly by clicking [here][download].

#### Install tiksDevice

Installing a package that is no longer supported is by no means difficult, but not as simple as ```install.package('tikzDevice')``` (try it if you want to see why). Use the following code install the tar file (make sure to specify your file path to wherever you downloaded the file). This is what it looked like for me.

    install.packages("/Users/USERNAME/Downloads/tikzDevice_0.6.2.tar", repos = NULL, type="source")

#### Install dependencies

In order for __tikzDevice__ to work, you must also install the __filehash__ package. This is much easier.

    install.packages('filehash')

That's it. Check out [this][tikz-latex] tutorial to see how to set up a project.

[why]: http://cran.r-project.org/web/packages/tikzDevice/index.html
[download]: http://cran.r-project.org/src/contrib/Archive/tikzDevice/tikzDevice_0.6.2.tar.gz
[tikz-latex]: /posts/2013-05-17_tikz_project/tikz_proj.html

