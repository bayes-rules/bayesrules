pulse_of_the_nation <- read_csv("data-raw/pulse_of_the_nation/pulse_of_the_nation.csv")

# Save the final data
usethis::use_data(pulse_of_the_nation, overwrite = TRUE)
