# Load the data
library(rattle)
library(lubridate)
data(weatherAUS)

# Take a sub-sample of the data
set.seed(22)
weather <- weatherAUS %>% 
          filter(Location %in% c("Wollongong", "Hobart", "Uluru")) %>% 
          mutate(Location = droplevels(as.factor(Location))) %>% 
          filter(!is.na(WindSpeed9am), !is.na(Humidity9am), !is.na(Pressure9am), !is.na(Temp9am), !is.na(Temp3pm)) %>% 
          group_by(Location) %>% 
          sample_n(100) %>% 
          ungroup() %>% 
          mutate(year = year(Date), month = month(Date), day_of_year = yday(Date)) %>% 
          select(-Date, -Cloud9am, -Cloud3pm, -Evaporation, -Sunshine)
names(weather) <- tolower(names(weather))
weather_australia <- weather

usethis::use_data(weather_australia, overwrite = TRUE)
