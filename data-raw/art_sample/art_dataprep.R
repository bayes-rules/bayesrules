library(RCurl)
library(tidyverse)

url <- getURL("https://raw.githubusercontent.com/artofstat/ArtistDiversity/master/artistdata.csv")
artist_diversity <- read.csv(text = url, na.strings = c("NA", "<NA>"))

set.seed(1)
art_sample <- artist_diversity %>% 
  filter(!is.na(gender), !is.na(ethnicity)) %>% 
  sample_n(., size = 100) %>% 
  mutate(gender = as.factor(gender),
         ethnicity = as.factor(ethnicity),
         GEO3major = as.factor(GEO3major)) 
  



usethis::use_data(art_sample, overwrite = TRUE)
