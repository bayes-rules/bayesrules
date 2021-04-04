# Import from tidytuesday

loons <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-06-18/bird_counts.csv") %>% 
          rename(count = how_many_counted, hours = total_hours, count_per_hour = how_many_counted_by_hour) %>% 
          filter(species == "Common Loon", year >= 2000) %>% 
          mutate(count_per_100 = round(count_per_hour*100)) %>% 
          dplyr::select(-species, -species_latin)

usethis::use_data(loons, overwrite = TRUE)
