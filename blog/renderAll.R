###############################################################################
# Homemade blogging - Render multiple files                                   #
# Joseph V. Casillas                                                          #
# Last update: 12/08/2016                                                     #
#                                                                             #
# - R script for knitting all .Rmd files spread across several directories    #
# - Should be sourced in Makefile for optimal use                             #
#     - open terminal                                                         #
#     - cd to /blog directory                                                 #
#     - make                                                                  #
###############################################################################


# Set WD to folder with blog posts
setwd("/Users/casillas/Desktop/test_site/blog")

# Get list of entry folders
temp <- list.files(path = ".", full.names = TRUE, pattern = "")

# There are 4 folders that are not blog entries. 
# Remove them from the directory list. 
total <- length(temp) - 4
dirs <- temp[1:total]

# For loop that searches each directory for a .Rmd file and knits it 
# In essence this updates all blog entries in one fell swoop. This is 
# ideal for when cosmetic changes are made to the website and you don't 
# want to knit each entry by hand. 
for (i in dirs){
  my_rmds <- list.files(path = i, full.names = TRUE, pattern = ".Rmd")
  rmarkdown::render(my_rmds)
}





