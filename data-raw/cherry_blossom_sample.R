library(dplyr)
library(mdsr)
data(Cherry)

# I.D. subjects that have 7 observations
subj <- Cherry %>%
          filter(nruns == 7) %>% 
          group_by(name.yob) %>%
          summarize(min_age = min(age)) %>%
          filter(min_age >= 50, min_age < 55) %>% 
          mutate(subject = as.factor(c(1:length(name.yob))))


cherry_blossom_sample <- Cherry %>%
          filter(name.yob %in% subj$name.yob) %>% 
          left_join(subj) %>% 
          rename(runner = subject) %>% 
          select(runner, age, net, gun, year, previous) %>% 
          mutate(runner = as.factor(runner))

usethis::use_data(cherry_blossom_sample, overwrite = TRUE)
