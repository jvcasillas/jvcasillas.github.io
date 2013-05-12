---
layout: post
title: "How to include IPA in R plots"
date: 2013-05-11 15:43:19
status: publish
categories: r-code LaTeX
---

 
#### The LaTeX file
 
    \documentclass{article}
    \usepackage{tikz}
    \usepackage{tipa}
 
    \begin{document}
 
    \include{plot}
 
    \end{document}
 
 
 
#### The R code
 
 

    require(tikzDevice)

    ## Loading required package: tikzDevice

    ## Loading required package: filehash

    ## Loading required package: methods

    ## filehash: Simple key-value database (2.2-1 2012-03-12)

    ## tikzDevice: A Device for R Graphics Output in PGF/TikZ Format (v0.6.2)
    ## Checking for a LaTeX compiler...

    ## A working LaTeX compiler was found by checking: The PATH using the command
    ## pdflatex
    ## 
    ## Global option tikzLatex set to: /usr/texbin/pdflatex

    ## pdfTeX 3.1415926-2.4-1.40.13 (TeX Live 2012) kpathsea version 6.1.0

    ## A working XeLaTeX compiler was found by checking: The PATH using the
    ## command xelatex
    ## 
    ## Global option tikzXelatex set to: /usr/texbin/xelatex

    ## XeTeX 3.1415926-2.4-0.9998 (TeX Live 2012) kpathsea version 6.1.0

 

    options(tikzLatexPackages = c(getOption("tikzLatexPackages"), "\\usepackage{tipa}"))

 

    tikz("/Users/casillas/Desktop/ipa_r_plot_tut/plot.tex")

    ## Error: Cannot create: /Users/casillas/Desktop/ipa_r_plot_tut/plot.tex
    ## Because the directory does not exist or is not writable.

 

    require(stats)
    plot(cars)
    lines(lowess(cars))

![plot of chunk unnamed-chunk-4](/images_temp/figure/unnamed-chunk-4.png) 

 

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