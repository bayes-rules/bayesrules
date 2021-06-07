library(dplyr)
library(here)

big_word_club <- read.csv(here("data-raw", "big_word_club", "big_word_club.csv")) %>% 
  mutate(score_pct_change = (score_a2 - score_a1) / score_a1 * 100) %>% 
  mutate(school_id = as.factor(school_id))

# The .pdf file type is not great in packages. 
# The codebook can be accessed from an earlier commit https://github.com/mdogucu/bayesrules/blob/d9a01160ddf5bebb4a1ac2bb9869d539a1c63589/data-raw/big_word_club/BWC%20Codebook.pdf

# Save the final data
usethis::use_data(big_word_club, overwrite = TRUE)
