big_word_club <- read_csv("data-raw/big_word_club/big_word_club.csv")

# Save the final data
usethis::use_data(big_word_club, overwrite = TRUE)
