# Import from tidytuesday

hotel_bookings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-02-11/hotels.csv') %>% 
          rename(average_daily_rate = adr)
          
usethis::use_data(hotel_bookings, overwrite = TRUE)
