library(RCurl)

x <- getURL("https://raw.githubusercontent.com/proback/BeyondMLR/master/data/bookbanningNoTex.csv")
book_banning <- read.csv(text = x) %>% 
          rename(title = booktitle, college_grad_rate = cperba, date = days2000,
                 lgbtq = homosexuality, median_income = cmedin, book_id = book,
                 explicit = sexexp, hs_grad_rate = cperhs, political_value_index = pvi2,
                 violent = violence) %>% 
          select(-X, -obama, -freqchal) %>% 
          mutate(date = as.Date(date, origin = "2000-01-01")) %>% 
          mutate(year = lubridate::year(date)) %>% 
          select(title, book_id, author, date, year, removed, 
                 explicit, antifamily, occult, language, lgbtq, violent,
                 state, political_value_index, median_income, hs_grad_rate, college_grad_rate) %>% 
          mutate_if(is.integer, as.factor)

usethis::use_data(book_banning, overwrite = TRUE)
