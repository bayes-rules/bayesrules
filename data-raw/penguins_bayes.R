library(palmerpenguins)
data(penguins)
penguins_bayes <- penguins %>% 
          mutate(species = as.factor(species)) %>% 
          mutate(above_average_weight = body_mass_g > 4200) %>% 
          mutate(above_average_weight = as.factor(as.numeric(above_average_weight))) %>% 
          select(species, island, year, bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g, above_average_weight, sex)


usethis::use_data(penguins_bayes, overwrite = TRUE)


