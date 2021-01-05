library(RCurl)

x <- getURL("https://raw.githubusercontent.com/proback/BeyondMLR/master/data/airbnb.csv")
airbnb <- read.csv(text = x) %>% 
          select(-X, -PctBlack) %>% 
          rename(minimum_stay = minstay, walk_score = WalkScore, 
                 transit_score = TransitScore, bike_score = BikeScore,
                 rating = overall_satisfaction)
          
usethis::use_data(airbnb, overwrite = TRUE)
