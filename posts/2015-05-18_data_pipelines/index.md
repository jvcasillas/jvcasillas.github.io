---
published: true
title: "Data pipelines in R"
date: "2015-05-18"
config: "../config.yml"
card: True
disqus: FALSE
analytics : True
---

## Overview

So you thought up a clever experiment, got IRB approval, recruited participants and collected data... now what? New researchers are often confronted with an unfortunate surprise when it comes time to perform some kind of analysis on their data: they don't know how, or even where to start. This can be a problem for something trivial, like obtaining simple descriptive statistics, or something much more complex, like fitting models, creating plots and making predictions. When we conduct experiments we don't usually begin by thinking about how we will analyze our data, and in many academic programs this is not explicitly taught to new students. For most people, especially beginners, the data analysis issue arises later on in the process, usually after data has already been collected (although I think this ultimately changes with experience). 

In light of all of this, I think that something handy to learn and evaluate early on is how data analysis pipelines typically flow: from obtaining data to obtaining new insight from the data. This is the data analysis pipeline, which usually looks something like this:


```r
library(tidyr); library(dplyr); library(DiagrammeR)

diagram1 <- "
graph LR
A[1. Collect data]-->B(2. tidy data) 
B-->C{3. transform data}
C-->D(4a. visualize data)
D-->C
C-->E(4b. analyze data)
E-->C
D-->F[New insight]
E-->F

style A fill:#DCEBE3
style B fill:#77DFC9
style C fill:#DEDBBA
style D fill:#F8F0CC
style E fill:#F8F0CC
style F fill:#DCEBE3
"
mermaid(diagram1, height = 200) 
```

![pipeline1](./assets/pipeline1.pdf)

In essence, the process is simple. After collecting your data, you need to *tidy* it (step 2) so that it can be loaded and analyzed by your statistical software. After tidying your data, you usually have to transform it (step 3) in some way (also called data preprocessing). This can be occur via the creation of new variables, combining variables, sub-setting variables, etc. Once you have transformed your data, it's time to visualize it (step 4a) via graphs/plots, and, finally, analyze it. The visualization and analysis steps are often iterative: you might notice something in a graph that leads you to a new analysis, or some kind of insight that requires more data transformation and a new analysis, and so on and so forth until you have obtained new insight and are able to answer your research question(s).

So, at the heart of data analysis is `tidy data`. Most new researchers don't know what it means to tidy and transform their data, nor that it is probably the most important part of any data analysis. Basically, if your data is not formatted in a way in which it can be easily analyzed (via excel, SPSS, R, etc.), then you can't do anything with it.

In order to facilitate the data analysis pipeline, it is crucial to have `tidy data`. What this means is that **every column in your data frame represents a variable and every row represents an observation**. This is also referred to as *long format* (as opposed to long format). Most statistical software requires your data to be in long format, with few exceptions (i.e. repeated measures ANOVA in SPSS). 

In what follows, I take you through three packages that have been created in order to facilitate the data analysis pipeline in R. Each package was created by Hadley Wickham with steps 2, 3, and 4a of the pipeline in mind. This we can associate each package with the corresponding step of the pipeline:



```r
type_1_nodes <-
  create_nodes(nodes = c("a", "b", "c", "d", "e", "f"),
               label = c("1. Collect data", "2. tidy data", "3. transform data", "4a. visualize data", "4b. analyze data", "New insight"),
               style = "filled",
               color = "darkgrey",
               shape = c("circle", "circle",
                         "circle", "triangle", "triangle"))

type_2_nodes <-
  create_nodes(nodes = c("g", "h", "i"),
               label = c("tidyr", "dplyr", "ggplot2/ggvis"),
               style = "filled",
               color = "lightblue",
               peripheries = c(2, 2, 2))

all_nodes <- combine_nodes(type_1_nodes, type_2_nodes)

type_1_edges <-
  create_edges(edge_from = c("a", "b", "c", "c", "d", "e"),
               edge_to = c("b", "c", "d", "e", "f", "f"))

type_2_edges <-
  create_edges(edge_from = c("b", "c", "d"),
               edge_to = c("g", "h", "i"),
               arrowhead = "dot",
               color = "red")

all_edges <- combine_edges(type_1_edges, type_2_edges)

create_graph(nodes_df = all_nodes,
             edges_df = all_edges,
             node_attrs = "fontname = Helvetica",
             edge_attrs = c("color = gray", "penwidth = 4")) %>% 
             render_graph
```

![pipeline2](./assets/pipeline2.pdf)

- tidyr
- dplyr
- basic plotting in r / ggvis




