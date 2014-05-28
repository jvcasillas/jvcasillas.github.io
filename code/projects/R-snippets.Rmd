---
config: "../config.yml"
disqus: True
---

### R-snippets

<p></p>

<iframe src="http://ghbtns.com/github-btn.html?user=jvcasill&repo=R-snippets&type=watch&count=true&size=large" height="30" width="170" frameborder="0" scrolling="0" style="width:130px; height: 30px;" allowTransparency="true"></iframe>
<iframe src="http://ghbtns.com/github-btn.html?user=jvcasill&repo=R-snippets&type=fork&count=true&size=large" height="30" width="170" frameborder="0" scrolling="0" style="width:130px; height: 30px;" allowTransparency="true"></iframe>
<iframe src="http://ghbtns.com/github-btn.html?user=jvcasill&type=follow&count=true&size=large" height="30" width="240" frameborder="0" scrolling="0" style="width:240px; height: 30px;" allowTransparency="true"></iframe>

<p></p>

This package includes a selection of R snippets for Sublimetext that I find useful when using R through SublimeREPL.  

Just type the trigger and hit the tab key. For example, typing <code>lm</code> brings up the following window:  

<div  class="thumbnail">
	<img width="100%" src="assets/lm.png" alt="lm image">
</div>
</br>

Selecting ```Random slope and random intercept model``` expands to...

	# load lme4 for mixed models
	library(lme4)

	# random intercept and random slope model
	modelName = lmer(DV ~ fixedFactor1 +* fixedFactor2 + (1 + randomSlope|randomInt), data=df)
	modelName

	hist(residuals(modelName))
	qqnorm(residuals(modelName))
	qqline(residuals(modelName))

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

