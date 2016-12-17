###############################################################################
# Homemade blogging - Render multiple files                                   #
# Joseph V. Casillas                                                          #
# Last update: 12/08/2016                                                     #
#                                                                             #
# - R script for knitting all .Rmd files in a single directory                #
# - Should be sourced in Makefile for optimal use                             #
#     - open terminal                                                         #
#     - cd to /code directory                                                 #
#     - make                                                                  #
###############################################################################


# Set WD to folder with blog posts
setwd("/Users/casillas/Desktop/test_site/code/projects")

# Get list of all .Rmd files in projects directory
my_rmds <- list.files(path = ".", full.names = TRUE, pattern = ".Rmd")

# For loop that knits all .Rmd files
# In essence this updates all project entries in one fell swoop. This is
# ideal for when cosmetic changes are made to the website and you don't 
# want to knit each project by hand. 
for (i in my_rmds){
  rmarkdown::render(i)
}





