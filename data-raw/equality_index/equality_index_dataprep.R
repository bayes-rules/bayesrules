equality_index <- read_csv("data-raw/equality_index/equality_index.csv") %>% 
          mutate_if(is.character, as.factor)

# Save the final data
usethis::use_data(equality_index, overwrite = TRUE)
