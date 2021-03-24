library(RCurl)

x <- getURL("https://raw.githubusercontent.com/proback/BeyondMLR/master/data/airbnb.csv")
airbnb <- read.csv(text = x) %>% 
          select(-X, -PctBlack) %>% 
          rename(minimum_stay = minstay, walk_score = WalkScore, 
                 transit_score = TransitScore, bike_score = BikeScore,
                 rating = overall_satisfaction) %>% 
          mutate(neighborhood = as.factor(neighborhood), district = as.factor(district), room_type = as.factor(room_type))
          
usethis::use_data(airbnb, overwrite = TRUE)
