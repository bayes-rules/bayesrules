# Load the data
library(rattle)
library(dplyr)
data(weatherAUS)

# Take a sub-sample of the data
set.seed(84735)
weather_perth <- weatherAUS %>% 
          filter(Location == "Perth") %>% 
          na.omit() %>% 
          sample_n(1000) %>% 
          mutate(year = year(Date), month = month(Date), day_of_year = yday(Date)) %>% 
          select(-Date, -Cloud9am, -Cloud3pm, -Evaporation, -Sunshine, -Location)

names(weather_perth) <- tolower(names(weather_perth))

usethis::use_data(weather_perth, overwrite = TRUE)
