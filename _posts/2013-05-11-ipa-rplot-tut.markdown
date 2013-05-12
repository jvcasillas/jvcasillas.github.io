---
layout: post
title: "How to include IPA in R plots"
date: 2013-05-11 15:43:19
categories: r-code LaTeX
---

#### Overview



##### The LaTeX file
 
    \documentclass{article}
    \usepackage{tikz}
    \usepackage{tipa}
 
    \begin{document}
 
    \include{plot}
 
    \end{document}
 
 
 
#### The R code
 
 

    require(tikzDevice)
    options(tikzLatexPackages = c(getOption("tikzLatexPackages"), "\\usepackage{tipa}"))

    tikz("/Users/casillas/Desktop/ipa_r_plot_tut/plot.tex")
    require(stats)
    plot(cars)
    lines(lowess(cars))
    
    dev.off()

![plot of chunk unnamed-chunk-4](/assets/images/figure/unnamed-chunk-2.png) 

 

    my_data <- read.delim("my_data.txt")
    library(ggplot2)

 

    my_data$group <- factor(my_data$group, levels = c("EL", "NE", "LL"))
    df <- with(my_data, aggregate(fpro, list(group = group, fstim = fstim), mean))
    df$se <- with(my_data, aggregate(fpro, list(group = group, fstim = fstim), function(x) sd(x)/sqrt(10)))[, 
        3]
    gp <- ggplot(df, aes(x = fstim, y = x, colour = group, ymin = x - se, ymax = x + 
        se))
    gp + geom_line(aes(linetype = group), size = 0.4) + geom_point(aes(shape = group)) + 
        geom_ribbon(alpha = 0.15, linetype = 0) + ylim(0, 1) + scale_x_continuous(breaks = seq(0, 
        10, by = 1)) + labs(list(title = "[\\textesh ip/\\textesh\\textsci p]", 
        x = "Stimuli", y = "\\% [\\textesh\\textsci p]")) + theme_bw() + theme(legend.background = element_rect(colour = "grey50", 
        fill = "grey97", size = 0.65, linetype = "solid")) + scale_linetype_discrete("Group") + 
        scale_shape_discrete("Group") + scale_colour_discrete("Group")

![plot of chunk unnamed-chunk-6](/assets/images/figure/ident_plot.png)