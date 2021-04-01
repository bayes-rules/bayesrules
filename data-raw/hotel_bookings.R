# Import from tidytuesday

set.seed(84735)
hotel_bookings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/hotels.csv') %>% 
          rename(average_daily_rate = adr) %>%
          sample_n(size = 1000) %>% 
          mutate(is_canceled = as.factor(is_canceled)) %>% 
          mutate_if(is.character, as.factor)
          
usethis::use_data(hotel_bookings, overwrite = TRUE)
