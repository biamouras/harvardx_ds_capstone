#' Script for one of the Capstone project of 
#' HarvardX's Data Science program

# Set up ----

# get the working directory
dir_wd <- here::here()

# load the libraries
{   
    # data loading, cleaning, manipulation and visualization
    library(tidyverse) 
    # machine learning
    library(caret)
}

# Download file ----

# the provided script to download and split downloaded incomplete data
# therefore, I used the provided links by wonyoungcheong (Staff)
# at post "Q1/3 - number of counts is off" of the "Discussion: Movielens Quiz"
# source(file.path(dir_wd, '01_scripts', 'edx_setup.R'))

# data directory
dir_data <- file.path(dir_wd, '00_data')

## detect if data_dir has already the data files ----

#

download.file("https://www.dropbox.com/s/4t4w48ut2gu8dn6/edx.rds?dl=1", 
              file.path(dir_data, "edx.rds"), mode = 'wb')

download.file("https://www.dropbox.com/s/c4jzznttgc01sdb/final_holdout_test.rds?dl=1", 
              file.path(dir_data, "final_holdout_test.rds"), mode = 'wb')

edx <- readRDS("00_data/edx.rds")

final_holdout_test <- readRDS("00_data/final_holdout_test.rds")

