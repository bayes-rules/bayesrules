library(readr)
library(dplyr)
library(reprex)
library(tidyr)

pop_vs_soda <- read_csv("data-raw/pop_vs_soda/pop_vs_soda_raw.csv") %>% 
          mutate_if(is.character, as.factor) %>% 
          mutate(state = tolower(state)) %>% 
          pivot_longer(cols = c("pop","soda","coke","other"), names_to = "word_for_cola", values_to = "count") %>% 
          uncount(count) %>% 
          mutate(pop = (word_for_cola == "pop"))

# Save the final data
usethis::use_data(pop_vs_soda, overwrite = TRUE)
