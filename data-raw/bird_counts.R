# Import from tidytuesday

bird_counts <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-06-18/bird_counts.csv") %>% 
  rename(count = how_many_counted, hours = total_hours, count_per_hour = how_many_counted_by_hour) %>% 
  mutate(count_per_week = count_per_hour*7*24)

usethis::use_data(bird_counts, overwrite = TRUE)
