# Original source: https://archive.ics.uci.edu/ml/datasets/Bike+Sharing+Dataset
bikes <- read.csv("https://www.macalester.edu/~ajohns24/data/bike_share.csv")

# Clean up & subset
set.seed(84735)
bike_users <- bikes %>% 
          gather(user, rides, -c(date,season,year,month,day_of_week,weekend,holiday,temp_actual,temp_feel,humidity,windspeed,weather_cat)) %>% 
          mutate(user = factor(user, labels = c("casual","registered","total"))) %>% 
          filter(user != "total", year == 2011) %>% 
          mutate(user = droplevels(user)) %>% 
          filter(temp_feel < 87, temp_feel > 45) %>% 
          mutate(date = as.Date(date, format = "%m/%d/%y")) %>% 
          arrange(date)
usethis::use_data(bike_users, overwrite = TRUE)
