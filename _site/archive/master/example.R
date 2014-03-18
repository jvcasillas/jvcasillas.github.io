# load tikszdevice
# set options so that tikz uses TIPA
# Tell tikz where to put the plot
# !!! this is not for the tex file to be compiled
# this is the actual plot that will be included
# in the final file (\include{plot_folder/ident_plot})

## @knitr load
require(tikzDevice)
options(tikzLatexPackages = c(getOption("tikzLatexPackages"),
                              "\\usepackage{tipa}"))

## @knitr cars
tikz( '/Users/casillas/Desktop/master/plots_folder/cars-plot.tex' )
plot(cars, main="[\\textipa{k}\\textscripta rs]", ylab="test", xlab="[se.po.ne.la.t\\textipa{R}ans.k\\textipa{R}ip.\\texttheta \\textsubarch{i}o.na.ki]")
dev.off()



## @knitr ident
tikz( '/Users/casillas/Desktop/master/plots_folder/ident-plot.tex' )

my_data <- read.delim("my-data.txt")
library(ggplot2)

my_data$group <- factor(my_data$group, levels = c("EL", "NE", "LL"))
df<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), mean))
df$se<-with(my_data, aggregate(fpro, list(group=group, fstim=fstim), function(x) sd(x)/sqrt(10)))[,3]
gp<-ggplot(df, aes(x=fstim, y=x, colour=group, ymin=x-se, ymax=x+se))
gp +geom_line(aes(linetype=group), size = .4) + 
    geom_point(aes(shape=group)) + 
    geom_ribbon(alpha = 0.15, linetype=0) + 
    #geom_errorbar(aes(ymax=x+se, ymin=x-se)) +
    ylim(0, 1) + 
    scale_x_continuous(breaks=seq(0, 10, by=1)) +
    labs(list(title = "e.xem.plo: \\textteshlig \\ \\texttheta \\ \\textbeta \\ \\textgamma \\ \\textctj \\ \\textipa{F} -- [\\textesh ip.be\\textipa{r}.sus.\\textesh\\textsci p]", 
              x = "Stimuli - [le.\\textgamma us.tan.loz.\\textipa{D}ul.\\texttheta es]", 
              y = "\\ \\ \\ \\% \\ \\ [\\textesh\\textsci p]")) +
    theme_bw() +
    theme(legend.background = element_rect(colour = 'grey50', 
                                           fill = 'grey97', size = .65, linetype='solid')) +
    scale_linetype_discrete("Group") +
    scale_shape_discrete("Group") +
    scale_colour_discrete("Group")


dev.off()
