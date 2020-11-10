library(tidyverse)

football <- Lock5Data::FootballBrain %>% 
rename(group = Group,
         hipp = Hipp) %>% 
  mutate(group = case_when(
    group == "no football" ~ "no_football",
    group == "FBNoConcuss" ~ "fb_no_concuss",
    group == "FBConcuss" ~ "fb_concuss",
    group == "Control" ~ "control"
  )) %>% 
  select(group, hipp)
usethis::use_data(football, overwrite = TRUE)
