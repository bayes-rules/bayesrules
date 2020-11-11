equality_index <- read_csv("data-raw/equality_index/equality_index.csv")

# Save the final data
usethis::use_data(equality_index, overwrite = TRUE)
