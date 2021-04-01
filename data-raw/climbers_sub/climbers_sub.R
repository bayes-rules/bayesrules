# Read tidytuesday data
members <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-22/members.csv')
peaks <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-22/peaks.csv') %>% 
  select(peak_id, height_metres, first_ascent_year)

climbers_sub <- members %>% 
          filter(age > 15, age < 78, year >= 1978)

set.seed(88)
random_exp <- climbers_sub %>% 
          group_by(expedition_id) %>% 
          summarise(count = n()) %>% 
          filter(count > 4) %>% 
          sample_n(200)

climbers_sub <- climbers_sub %>% 
          group_by(expedition_id) %>% 
          right_join(random_exp) %>% 
          left_join(peaks) %>% 
          mutate_if(is.character, as.factor)



# Store as climbers_sub
usethis::use_data(climbers_sub, overwrite = TRUE)
