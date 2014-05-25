---
layout: post
title: test blog post
date: 2014-05-24
tags: [test, fun, R]
published: true
status: publish
categories: r-code
analytics : true
comments : true
---


# Simulate data

This section shows how to simulate the data. The ```R Source``` tab shows the 
code input into R. The ```R Output``` tab shows what the R console displays 
after running the code. 

The structure is as follows: 

- 40 participants 
- 2 groups (sp/cat)
- 3 etm (b, v, vb)
- 8 items per level of etm
- 4 repetitions of each item (not included)

That gives a total of 960 rows (not counting the repetitions), so that is what 
we have to simulate. Remember that the dependent variable is no longer binary, 
the percents represent the proportion of times the participants produced [v].


```r
# generate 40 participants
participant <- 1:40
participants <- rep(participant,24)
participants <- sort(participants)

# Assign participants to two groups (cat/sp)
# factor called 'bil' (bilingual)
bil <- c(rep("cat", 480),rep("sp", 480))
df <- as.data.frame(cbind(participants,bil))

# Create factor etimology (etm)
# 3 levels (b, v, v>b)
df$etm <- c(rep("b", 8), rep("v", 8), rep("vb", 8))
df$etm <- as.factor(df$etm)

# Create 8 items for each level of 'etm'
# Note: items have been repeated 4 times, these averages
# are included here already
df$items <- c("b1","b2","b3","b4","b5","b6","b7","b8",
			  "v1","v2","v3","v4","v5","v6","v7","v8",
			  "vb1","vb2","vb3","vb4","vb5","vb6","vb7","vb8")
df$items <- as.factor(df$items)

# sort rows of dataframe
df <- df[with(df, order(bil, etm)), ]

# Generate percents (proportion of [v] production)
set.seed(1)
propcatb <- rnorm(160, 20, 5)
propcatv <- rnorm(160,92, 3)
propcatvb <- rnorm(160, 20, 5)
propspb <- rnorm(160, 20, 4)
propspv <- rnorm(160,35, 5)
propspvb <- rnorm(160, 50, 10)

df$prop <- c(propcatb, 
	         propcatv,
	         propcatvb,
	         propspb,
	         propspv,
	         propspvb)

df <- df[with(df, order(participants, bil, etm)), ]
```

That should do it. We use the ```summary()``` command to see if it worked and 
the ```structure()``` command to make sure our factors are indeed factors.


```r
# Check data
summary(df)
```

```
##   participants  bil      etm          items          prop      
##  1      : 24   cat:480   b :320   b1     : 40   Min.   : 4.96  
##  10     : 24   sp :480   v :320   b2     : 40   1st Qu.:19.71  
##  11     : 24             vb:320   b3     : 40   Median :27.97  
##  12     : 24                      b4     : 40   Mean   :39.49  
##  13     : 24                      b5     : 40   3rd Qu.:51.60  
##  14     : 24                      b6     : 40   Max.   :99.95  
##  (Other):816                      (Other):720
```

```r
str(df)
```

```
## 'data.frame':	960 obs. of  5 variables:
##  $ participants: Factor w/ 40 levels "1","10","11",..: 1 1 1 1 1 1 1 1 1 1 ...
##  $ bil         : Factor w/ 2 levels "cat","sp": 1 1 1 1 1 1 1 1 1 1 ...
##  $ etm         : Factor w/ 3 levels "b","v","vb": 1 1 1 1 1 1 1 1 2 2 ...
##  $ items       : Factor w/ 24 levels "b1","b2","b3",..: 1 2 3 4 5 6 7 8 9 10 ...
##  $ prop        : num  16.9 20.9 15.8 28 21.6 ...
```

Looks good. 

Here's the output on one participant in a pretty table:


```r
knitr::kable(head(df, 24))
```



|participants |bil |etm |items |  prop|
|:------------|:---|:---|:-----|-----:|
|1            |cat |b   |b1    | 16.87|
|1            |cat |b   |b2    | 20.92|
|1            |cat |b   |b3    | 15.82|
|1            |cat |b   |b4    | 27.98|
|1            |cat |b   |b5    | 21.65|
|1            |cat |b   |b6    | 15.90|
|1            |cat |b   |b7    | 22.44|
|1            |cat |b   |b8    | 23.69|
|1            |cat |v   |v1    | 93.28|
|1            |cat |v   |v2    | 91.28|
|1            |cat |v   |v3    | 95.18|
|1            |cat |v   |v4    | 94.66|
|1            |cat |v   |v5    | 90.14|
|1            |cat |v   |v6    | 98.62|
|1            |cat |v   |v7    | 91.23|
|1            |cat |v   |v8    | 87.73|
|1            |cat |vb  |vb1   | 26.54|
|1            |cat |vb  |vb2   | 27.49|
|1            |cat |vb  |vb3   | 24.07|
|1            |cat |vb  |vb4   | 10.65|
|1            |cat |vb  |vb5   | 22.41|
|1            |cat |vb  |vb6   | 22.28|
|1            |cat |vb  |vb7   | 18.23|
|1            |cat |vb  |vb8   | 20.85|

# Plot it

This uses the ```lattice``` library to create boxplots. Pretty straightforward.


```r
#-----------------------------------------
# plots
#-----------------------------------------

library(lattice)
bwplot(prop ~ etm|bil, data = df, ylab="% [v]")
```

![plot of chunk unnamed-chunk-4](assets/fig/unnamed-chunk-4.png) 


# Analyze it

"The data were analyzed using a 2 x (3) mixed design ANOVA...". I also included
an analysis using linear mixed effects because I don't know how the bossman told
you to analyze the data. Take your pick. You need to decide on the post-hoc 
analysis based on your research questions but this should be a good start.


```r
#-----------------------------------------
# analysis
#-----------------------------------------

# 2 x (3) mixed design anova
aov.prop = aov(prop ~ bil * etm + Error(participants/etm), data=df)
summary(aov.prop)
```

```
## 
## Error: participants
##           Df Sum Sq Mean Sq F value Pr(>F)    
## bil        1  19899   19899     891 <2e-16 ***
## Residuals 38    849      22                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: participants:etm
##           Df Sum Sq Mean Sq F value Pr(>F)    
## etm        2 310046  155023    5723 <2e-16 ***
## bil:etm    2 322780  161390    5958 <2e-16 ***
## Residuals 76   2059      27                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Error: Within
##            Df Sum Sq Mean Sq F value Pr(>F)
## Residuals 840  31709    37.7
```

```r
# Get descriptives from ANOVA table
model.tables(aov.prop, "means")
```

```
## Tables of means
## Grand mean
##       
## 39.49 
## 
##  bil 
## bil
##   cat    sp 
## 44.05 34.94 
## 
##  etm 
## etm
##     b     v    vb 
## 19.96 63.34 35.18 
## 
##  bil:etm 
##      etm
## bil   b     v     vb   
##   cat 20.02 92.25 19.86
##   sp  19.89 34.42 50.51
```

```r
# Make subset
postb = subset(df,etm=="b")
# Make subset
postv = subset(df,etm=="v")
# Make subset
postvb = subset(df,etm=="vb")


# all models were Bonferroni corrected
# 0.05 / 3 = 0.01 (new alpha level)

# One-way between subjects ANOVA (same as ttest)
# compare cat vs. sp for 'b'
aov.postb = aov(prop ~ bil, data=postb)
summary(aov.postb)
```

```
##              Df Sum Sq Mean Sq F value Pr(>F)
## bil           1      1    1.44    0.07   0.79
## Residuals   318   6225   19.58
```

```r
# One-way between subjects ANOVA
# compare cat vs. sp for 'v'
aov.postv = aov(prop ~ bil, data=postv)
summary(aov.postv)
```

```
##              Df Sum Sq Mean Sq F value Pr(>F)    
## bil           1 267539  267539   13608 <2e-16 ***
## Residuals   318   6252      20                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

```r
# One-way between subjects ANOVA
# compare cat vs. sp for 'vb'
aov.postvb = aov(prop ~ bil, data=postvb)
summary(aov.postvb)
```

```
##              Df Sum Sq Mean Sq F value Pr(>F)    
## bil           1  75138   75138    1079 <2e-16 ***
## Residuals   318  22139      70                   
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

