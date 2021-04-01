library(RCurl)
library(dplyr)

x <- getURL("https://raw.githubusercontent.com/proback/BeyondMLR/master/data/airbnb.csv")
airbnb_small <- read.csv(text = x) %>% 
          select(-X, -PctBlack) %>% 
          rename(minimum_stay = minstay, walk_score = WalkScore, 
                 transit_score = TransitScore, bike_score = BikeScore,
                 rating = overall_satisfaction) %>% 
          mutate(neighborhood = as.factor(neighborhood), district = as.factor(district), room_type = as.factor(room_type)) %>% 
          filter(district %in% c("Far North", "North", "Northwest")) %>%
          droplevels()

usethis::use_data(airbnb_small, overwrite = TRUE)
