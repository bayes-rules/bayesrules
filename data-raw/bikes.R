# Original source: https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset
bikes <- read.csv("https://www.macalester.edu/~ajohns24/data/bike_share.csv")

# Clean up & subset
set.seed(84735)
bikes <- bikes %>% 
          mutate(rides = riders_registered) %>% 
          mutate(date = as.Date(date, format = "%m/%d/%y")) %>% 
          select(-riders_casual, -riders_total, -riders_registered) %>% 
          filter(temp_feel < 87, temp_feel > 45) %>% 
          mutate(humidity = 100*humidity) %>% 
          sample_n(500) %>% 
          arrange(date)
usethis::use_data(bikes, overwrite = TRUE)
