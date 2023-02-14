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
dir_data <- file.path(dir_wd, '00_data', 'movielens')
# create folder if it doesn't exist
dir.create(dir_data, showWarnings = FALSE)

## detect if data_dir has already the data files and download it ----

if(length(list.files(dir_data, '.rds')) == 0){
  download.file("https://www.dropbox.com/s/4t4w48ut2gu8dn6/edx.rds?dl=1", 
                file.path(dir_data, "edx.rds"), mode = 'wb')
  
  download.file("https://www.dropbox.com/s/c4jzznttgc01sdb/final_holdout_test.rds?dl=1", 
                file.path(dir_data, "final_holdout_test.rds"), mode = 'wb')
}

## read files ----
edx <- readRDS(file.path(dir_data, "edx.rds"))

final_holdout_test <- readRDS(file.path(dir_data, "final_holdout_test.rds"))

# Exploring data: Quiz analysis ----

# dimensions
dim(edx)

# columns' names
colnames(edx)

# how many zeros as rating
sum(edx$rating == 0)

# how many threes as rating
sum(edx$rating == 3)

# how many movies
length(unique(edx$movieId))

# how many users 
length(unique(edx$userId))

## how many of ratings for each genre ----

# drama
sum(str_detect(edx$genres,'Drama'))

# comedy
sum(str_detect(edx$genres,'Comedy'))

# thriller
sum(str_detect(edx$genres,'Thriller'))

# romance
sum(str_detect(edx$genres,'Romance'))

## Movies with most ratings ----
edx %>% 
  # counts per title the # of ratings (observations)
  count(title) %>% 
  # orders by descendent number of ratings
  arrange(desc(n)) %>% 
  # gets the top 3
  head(.,3)

## Rating with most selection ----
edx %>% 
  # counts per grade of rating the # of times that it was selected
  count(rating) %>% 
  # orders by descendent number of selection
  arrange(desc(n))

