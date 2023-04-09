# clean working directory
rm(list = ls(all = TRUE))

# Set working directory
setwd("~/Desktop/despacito")

# read data
bieb_temp <- read.csv("./data/despacito.csv", header = TRUE, quote = "")

library(tidyverse); library(lingStuff)

glimpse(bieb_temp)


hold_e <- bieb_temp %>%
  select(prefix, 
         f1 = f1e, 
         f2 = f2e, 
         f1_20 = f1_20e, 
         f1_35 = f1_35e, 
         f1_50 = f1_50e, 
         f1_65 = f1_65e, 
         f1_80 = f1_80e, 
         f2_20 = f2_20e,
         f2_35 = f2_35e,
         f2_50 = f2_50e,
         f2_65 = f2_65e,
         f2_80 = f2_80e, 
         tl = tle) %>%
  mutate(vowel = 'e') 

hold_a <- bieb_temp %>%
  select(prefix, 
         f1 = f1a, 
         f2 = f2a, 
         f1_20 = f1_20a, 
         f1_35 = f1_35a, 
         f1_50 = f1_50a, 
         f1_65 = f1_65a, 
         f1_80 = f1_80a, 
         f2_20 = f2_20a,
         f2_35 = f2_35a,
         f2_50 = f2_50a,
         f2_65 = f2_65a,
         f2_80 = f2_80a, 
         tl = tla) %>%
  mutate(vowel = 'a') 

hold_i <- bieb_temp %>%
  select(prefix, 
         f1 = f1i, 
         f2 = f2i, 
         f1_20 = f1_20i, 
         f1_35 = f1_35i, 
         f1_50 = f1_50i, 
         f1_65 = f1_65i, 
         f1_80 = f1_80i, 
         f2_20 = f2_20i,
         f2_35 = f2_35i,
         f2_50 = f2_50i,
         f2_65 = f2_65i,
         f2_80 = f2_80i, 
         tl = tli) %>%
  mutate(vowel = 'i') 

vowels_temp <- rbind(hold_e, hold_a)
bieb_vowels <- rbind(vowels_temp, hold_i)


vowel_plot(bieb_vowels, vowel = 'vowel', f1 = 'f1_80', f2 = 'f2_80')






bieb_temp %>%
  select(., prefix, votP, votT) %>%
  gather(., key = phon, value = vot, -prefix) %>%
  ggplot(., aes(x = phon, y = vot, color = phon)) + 
    stat_summary(fun.data = 'mean_cl_boot', geom = 'pointrange', size = 1) +
    stat_summary(fun.y = 'mean', geom = 'point', color = 'black', size = 2.5) +
    ylim(0, 40) + 
    scale_x_discrete(labels = c('/p/', '/t/')) + 
    coord_flip() + 
    scale_color_brewer(name = '', guide = F) + 
    theme_dark()