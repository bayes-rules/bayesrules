# Import from tidytuesday

coffee_ratings <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv') %>% 
  select(owner, farm_name, mill, in_country_partner,
         country_of_origin, altitude_low_meters, altitude_high_meters, altitude_mean_meters,
         number_of_bags, bag_weight, 
         species, variety, processing_method, aroma, flavor, aftertaste,
         acidity, body, balance, uniformity, clean_cup, sweetness,
         moisture, category_one_defects, category_two_defects, color, total_cup_points)



usethis::use_data(coffee_ratings, overwrite = TRUE)
