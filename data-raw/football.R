library(tidyverse)

football <- Lock5Data::FootballBrain %>% 
  rename(group = Group, years = Years) %>% 
  mutate(volume = Hipp / 1000, 
    group = case_when(
      group == "no football" ~ "no_football",
      group == "FBNoConcuss" ~ "fb_no_concuss",
      group == "FBConcuss" ~ "fb_concuss",
      group == "Control" ~ "control"
    )
  ) %>% 
  select(group, years, volume) %>% 
  mutate_if(is.character, as.factor)
usethis::use_data(football, overwrite = TRUE)
