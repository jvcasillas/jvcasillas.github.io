---
layout: post
title: "How to include IPA in R plots"
date: 2013-05-11 15:43:19
categories: r-code
analytics : true
tags: r LaTeX tikzDevice tutorial
---


#### Overview



##### The LaTeX file
 
    \documentclass{article}
    \usepackage{tikz}
    \usepackage{tipa}
    
    \begin{document}
    
    \include{plot}
    
    \end{document}
 
 
 
##### The R code
 
 

    require(tikzDevice)
    options(tikzLatexPackages = c(getOption("tikzLatexPackages"), 
    "\\usepackage{tipa}"))

    tikz("/Users/casillas/Desktop/ipa_r_plot_tut/plot.tex")
    require(stats)
    plot(cars)
    lines(lowess(cars))
    
    dev.off()

  
  
Which produces...
  
  
  
![plot of chunk unnamed-chunk-4](/assets/images/figure/unnamed-chunk-2.png) 
  
  
  
That's great, but to see why this is really worth the trouble, let's plot something more common in linguistics. For example, here are the results of a fake 2AFC identification experiment where the y-axis is the proportion of one of the choices (the proportion of times the participants selected the word 'sheep' in this example) and the x-axis is each step in a resynthesized vowel continuum (11-steps from /i/ to /I/). You can download the fake data [here][fake-data] if you want to try. Here's the code.
  
  
    require(tikzDevice)
    options(tikzLatexPackages = c(getOption("tikzLatexPackages"), 
    "\\usepackage{tipa}"))
    
    tikz("/Users/USERNAME/Desktop/folderName/plot.tex")
    
    my_data <- read.delim("my_data.txt")
    library(ggplot2)
    
    my_data$group <- factor(my_data$group, levels = c("EL", "NE", "LL"))
    df <- with(my_data, aggregate(fpro, list(group = group, fstim = fstim), mean))
    df$se <- with(my_data, aggregate(fpro, list(group = group, fstim = fstim), function(x) sd(x)/sqrt(10)))[,3]
    gp <- ggplot(df, aes(x = fstim, y = x, colour = group, ymin = x - se, ymax = x + se))
    gp + geom_line(aes(linetype = group), size = 0.4) + geom_point(aes(shape = group)) + 
        geom_ribbon(alpha = 0.15, linetype = 0) + ylim(0, 1) + scale_x_continuous(breaks = seq(0,10, by = 1)) + 
        labs(list(title = "[\\textesh ip/\\textesh\\textsci p]", x = "Stimuli", y = "\\% [\\textesh\\textsci p]")) + 
        theme_bw() + theme(legend.background = element_rect(colour = "grey50", fill = "grey97", size = 0.65, linetype = "solid")) + 
        scale_linetype_discrete("Group") + 
        scale_shape_discrete("Group") + 
        scale_colour_discrete("Group")
    
    dev.off()

  
Here is the output.
  
  

![plot of chunk unnamed-chunk-6](/assets/images/figure/ident_plot.png)

  
Notice that we can use IPA (using the TIPA LaTeX package). Yeah! Also, the font is the same (times) as the rest of the output in the .tex document.
  

[fake-data]: /archive/ipa_rplot_tut/my_data.txt

<div id="disqus_thread"></div>
<script type="text/javascript">
    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
    var disqus_shortname = 'jvcasill'; // required: replace example with your forum shortname

    /* * * DON'T EDIT BELOW THIS LINE * * */
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>
<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
<a href="http://disqus.com" class="dsq-brlink">comments powered by <span class="logo-disqus">Disqus</span></a>