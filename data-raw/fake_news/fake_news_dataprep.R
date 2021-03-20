# Cleaning the fake_news data

# SOURCE: https://www.kaggle.com/mdepak/fakenewsnet
# Help from https://www.kaggle.com/kumudchauhan/fake-news-analysis-and-classification


# Load libraries
library(dplyr)
library(readr)
library(stringr)
library(syuzhet)
library(quanteda)


# Load kaggle data
set.seed(84735)
buzzfeed_real <- read_csv("data-raw/fake_news/BuzzFeed_real_news_content.csv")
buzzfeed_real <- buzzfeed_real %>% 
  mutate(type = rep("real",nrow(buzzfeed_real))) %>% 
  sample_n(90)

set.seed(84735)
buzzfeed_fake <- read_csv("data-raw/fake_news/BuzzFeed_fake_news_content.csv")
buzzfeed_fake <- buzzfeed_fake %>% 
  mutate(type = rep("fake",nrow(buzzfeed_fake))) %>% 
  sample_n(size = 60)

# Combine & simplify
fake_news <- rbind(buzzfeed_real, buzzfeed_fake) %>% 
  select(-c(id, meta_data, canonical_link, images, movies, publish_date, top_img, source))





# Check it out
dim(fake_news)
table(fake_news$type)


# Some guidance / ideas adapted from https://www.kaggle.com/burakhmmtgl/exploratory-analysis


# Count the number of words & characters
fake_news <- fake_news %>% 
  mutate(title_words = sapply(strsplit(as.character(fake_news$title), " "), length)) %>% 
  mutate(text_words = sapply(strsplit(as.character(fake_news$text), " "), length)) %>% 
  mutate(title_char = str_count(title)) %>%
  mutate(text_char = str_count(text))

# Count the number & percent of words that are all capital letters
fake_news <- fake_news %>% 
  mutate(title_caps = str_count(title, "\\b[A-Z]{2,}\\b")) %>%
  mutate(text_caps = str_count(text, "\\b[A-Z]{2,}\\b")) %>% 
  mutate(title_caps_percent = title_caps / title_words * 100) %>% 
  mutate(text_caps_percent = text_caps / text_words * 100)


# Number & percent of characters that are exclamation marks
fake_news <- fake_news  %>% 
  mutate(title_excl = str_count(title, "!")) %>%
  mutate(text_excl = str_count(text, "!")) %>% 
  mutate(title_excl_percent = title_excl / title_char * 100) %>% 
  mutate(text_excl_percent = text_excl / text_char * 100) %>% 
  mutate(title_has_excl = title_excl > 0)

# Sentiment analysis
sentiments <- round((get_nrc_sentiment(as.character(fake_news$title)) + get_nrc_sentiment(as.character(fake_news$text))) / (fake_news$title_words + fake_news$text_words)*100, 2)
fake_news <- cbind(fake_news, sentiments)


# Syllables per word
fake_news <- fake_news %>% 
  mutate(text_syllables = nsyllable(as.character(text))) %>% 
  mutate(text_syllables_per_word = text_syllables / text_words)

#ggplot(fake_news, aes(x = title_char, fill = type)) +
#  geom_density(alpha = 0.5)


# Resample so that not batched by real and fake status
set.seed(84735)
fake_news <- sample_n(fake_news, size = nrow(fake_news)) %>% 
  mutate(type = as.factor(type))




# Save the final data
usethis::use_data(fake_news, overwrite = TRUE)
