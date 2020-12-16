# Import original data from Bodo Winter

voices <- readr::read_csv("http://www.bodowinter.com/uploads/1/2/9/3/129362560/politeness_data.csv") %>% 
          select(-gender) %>% 
          rename(pitch = frequency) %>% 
          mutate(subject = as.factor(rep(c("C","A","B","D","E","F"), each = 14)),
                 attitude = forcats::fct_recode(attitude, polite = "pol", informal = "inf"),
                 scenario = as.factor(chartr("1234567", "ABCDEFG", scenario))) %>% 
          arrange(subject)

usethis::use_data(voices, overwrite = TRUE)
