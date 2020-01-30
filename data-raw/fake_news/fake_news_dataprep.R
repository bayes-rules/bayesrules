## SOURCE: https://www.kaggle.com/mdepak/fakenewsnet


## Help from https://www.kaggle.com/kumudchauhan/fake-news-analysis-and-classification

library(ggplot2)
library(dplyr)
library(readr)
library(tidyr)
library(purrr)
library(stringr)
library(tidytext)
library(syuzhet)
library(lubridate)

set.seed(84735)


buzzfeed_real <- read_csv("data-raw/fake_news/BuzzFeed_real_news_content.csv") %>% 
  mutate(type = rep("real",nrow(.))) %>% 
  sample_n(90)


buzzfeed_fake <- read_csv("data-raw/fake_news/BuzzFeed_fake_news_content.csv") %>% 
  mutate(type = rep("fake",nrow(.))) %>% 
  sample_n(size = 60)

# Combine
buzzfeed_df <- rbind(buzzfeed_real, buzzfeed_fake)


# Simplify
buzzfeed_df <- buzzfeed_df %>% 
  select(-c(id, meta_data, 
            canonical_link, 
            images, 
            movies, 
            publish_date, 
            top_img, 
            source))

# Check it out
dim(buzzfeed_df)
table(buzzfeed_df$type)


## Text processing (will add more later...)

# Number of exclamation marks
fake_news <- buzzfeed_df %>% 
  mutate(title_exclamation = 
           str_count(title, "!") > 0)


# Save the final data
usethis::use_data(fake_news, overwrite = TRUE)
