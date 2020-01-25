library(magrittr)
library(dplyr)

# Read data
bechdel <- readr::read_csv("https://raw.githubusercontent.com/fivethirtyeight/data/master/bechdel/movies.csv") %>%
  select(year, title, binary)




# Save the final data
usethis::use_data(bechdel, overwrite = TRUE)
