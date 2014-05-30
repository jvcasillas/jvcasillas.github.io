---
title: "Knitr bootstrap"
date: "2014-05-27"
config: "../config.yml"
card: True
disqus: True
analytics : true
---

Knitr bootstrap makes generating standalone reports extremely easy and the output looks really neat. Check out the example [here][here]. To recreate this you need to download the preview release of [R Studio][R Studio], and set up the front matter as follows:

	---
	output:
	  knitrBootstrap::bootstrap_document:
	    title: ""
	    theme: default
	    highlight: sunburst
	    theme.chooser: TRUE
	    highlight.chooser: TRUE
	---

[here]: /posts/assets/knitr_bootstrap/knitr_bootstrap.html
[R Studio]: http://rmarkdown.rstudio.com/index.html
