# Import from tidytuesday

coffee_ratings_small <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv') %>% 
          select(farm_name, total_cup_points, aroma, flavor, aftertaste, 
                 acidity, body, balance, uniformity, sweetness, moisture) %>% 
          group_by(farm_name) %>% 
          filter(n() >= 5, aroma > 0) %>% 
          ungroup()


usethis::use_data(coffee_ratings_small, overwrite = TRUE)
