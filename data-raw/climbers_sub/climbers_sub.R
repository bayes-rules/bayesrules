# Read tidytuesday data
members <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-09-22/members.csv')

# Store as climbers
write.csv(members, here("data-raw", "climbers_sub", "climbers.csv"), row.names = FALSE)


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
          right_join(random_exp)


# Store as climbers_sub
usethis::use_data(climbers_sub, overwrite = TRUE)
