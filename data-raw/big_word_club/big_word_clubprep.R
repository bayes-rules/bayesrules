big_word_club <- read_csv("data-raw/big_word_club/big_word_club.csv")

# The .pdf file type is not great in packages. 
# The codebook can be accessed from an earlier commit https://github.com/mdogucu/bayesrules/blob/d9a01160ddf5bebb4a1ac2bb9869d539a1c63589/data-raw/big_word_club/BWC%20Codebook.pdf

# Save the final data
usethis::use_data(big_word_club, overwrite = TRUE)
