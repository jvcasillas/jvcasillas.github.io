---
published: false
status: process
---

How to include IPA in R plots
========================================================


## The LaTeX file

    \documentclass{article}
    \usepackage{tikz}
    \usepackage{tipa}

    \begin{document}

    \include{plot}

    \end{document}



## The R code



```r
require(tikzDevice)
```

```
## Loading required package: tikzDevice
## Loading required package: filehash
## Note: the specification for S3 class "connection" in package 'filehash' seems equivalent to one from package 'RJSONIO': not turning on duplicate class definitions for this class.
## Note: the specification for S3 class "file" in package 'filehash' seems equivalent to one from package 'RJSONIO': not turning on duplicate class definitions for this class.
## filehash: Simple key-value database (2.2-2 2013-12-16)
```


```r
options(tikzLatexPackages = c(getOption("tikzLatexPackages"),
                              "\\usepackage{tipa}"))
```


```r
tikz( '/Users/casillas/Desktop/ipa_r_plot_tut/plot.tex' )
```

```
## Error: Cannot create:
## 	 /Users/casillas/Desktop/ipa_r_plot_tut/plot.tex 
## Because the directory does not exist or is not writable.
```


```r
require(stats)
plot(cars)
lines(lowess(cars))
```

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4.png) 


```r
my_data <- read.delim("my_data.txt")
library(ggplot2)
```


```r
my_data$group <- factor(my_data$group, levels = c("EL", "NE", "LL"))
df<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), mean))
df$se<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), function(x) sd(x)/sqrt(10)))[,3]
gp<-ggplot(df, aes(x=fstim, y=x, colour=group, ymin=x-se, ymax=x+se))
gp +geom_line(aes(linetype=group), size = .4) + 
    geom_point(aes(shape=group)) + 
    geom_ribbon(alpha = 0.15, linetype=0) + 
    ylim(0, 1) + 
    scale_x_continuous(breaks=seq(0, 10, by=1)) +
    labs(list(title = "[\\textesh ip/\\textesh\\textsci p]", 
              x = "Stimuli", y = "\\% [\\textesh\\textsci p]")) +
    theme_bw() +
    theme(legend.background = element_rect(colour = 'grey50', 
          fill = 'grey97', size = .65, linetype='solid')) +
    scale_linetype_discrete("Group") +
    scale_shape_discrete("Group") +
    scale_colour_discrete("Group")
```

![plot of chunk unnamed-chunk-6](assets/fig/unnamed-chunk-6.png) 

