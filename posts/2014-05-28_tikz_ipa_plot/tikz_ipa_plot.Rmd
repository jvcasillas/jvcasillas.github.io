---
published: false
title: "How to include IPA in R plots"
date: "2014-05-27"
config: "../config.yml"
card: True
disqus: True
analytics : true
---



#### The LaTeX file

    \documentclass{article}
    \usepackage{tikz}
    \usepackage{tipa}

    \begin{document}

    \include{plot}

    \end{document}



#### The R code



Comment here. 

    require(tikzDevice)
    options(tikzLatexPackages = c(getOption("tikzLatexPackages"),
                                      "\\usepackage{tipa}"))
    tikz( 'assets/plot.tex', standAlone=TRUE )
    library(stats)
    plot(cars)
    lines(lowess(cars))
    dev.off()

Comments here
<img width="100%" src="assets/plot.pdf">

Now let's do it with some IPA. Download this dataset and load it into R.

    my_data <- read.delim("assets/my_data.txt")
    
We will use ggplot2 for this graph.

    library(ggplot2)

Now we will call tikz device.

    require(tikzDevice)
    options(tikzLatexPackages = c(getOption("tikzLatexPackages"), "\\usepackage{tipa}"))
    tikz('assets/ipa_plot.tex', standAlone=TRUE, width=5, height=5)
    my_data$group <- factor(my_data$group, levels = c("EL", "NE", "LL"))
    df<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), mean))
    df$se<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), function(x) sd(x)/sqrt(10)))[,3]
    gp <- ggplot(df, aes(x=fstim, y=x, colour=group, ymin=x-se, ymax=x+se))
    gp + geom_line(aes(linetype=group), size = .4) + 
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
    dev.off()


Comments here
<img width="100%" src="assets/ipa_plot.pdf">

