---
layout: default
title: R-snippets
analytics : true
---

##R-snippets

<div>
<iframe src="http://ghbtns.com/github-btn.html?user=mdo&repo=github-buttons&type=watch"
  allowtransparency="true" frameborder="0" scrolling="0" width="62" height="20"></iframe>
</div>

<div align="left">
	<button class="clean-gray"><a href="https://github.com/jvcasill/R-snippets/zipball/master">Download <strong>ZIP File</strong></a></button>
	<button class="clean-gray"><a href="https://github.com/jvcasill/R-snippets/tarball/master">Download <strong>TAR Ball</strong></a></button>
	<button class="clean-gray"><a href="https://github.com/jvcasill/R-snippets">View On <strong>GitHub</strong></a></button>
</div>
</br>
  
This package includes a selection of R snippets for Sublimetext that I find useful when using R through SublimeREPL.

Just type the trigger and hit the tab key. For example, typing `lm` brings up the following window:

<div  class="thumbnail">
	<img width="100%" src="/assets/images/lm.png" alt="lm image">
</div>
</br>

Selecting `Random slope and random intercept model` expands to...

{% highlight js %}
# load lme4 for mixed models
library(lme4)

# random intercept and random slope model
modelName = lmer(DV ~ fixedFactor1 +* fixedFactor2 + (1 + randomSlope|randomInt), data=df)
modelName

hist(residuals(modelName))
qqnorm(residuals(modelName))
qqline(residuals(modelName))
{% endhighlight %}

Main triggers:  

- "plot": templates for plotting in base R
- "edit": options useful for data cleansing and saving
- "desc": descriptive statistics of data
- "ttest": distinct types of t-test
- "aov": distinct analysis of variance models
- "lm": linear and logistic regression
- "lmem": linear mixed effects models

Extras:  

- "subset": make subsets of a DF
- "read": read/load/install data/packages into R
- "save": save plots, dfs, tables, etc.
- "tikz": template for creating R plots in LaTeX

