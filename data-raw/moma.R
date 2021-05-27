library(RCurl)
library(tidyverse)
library(lubridate)


url = getURL("https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv")
moma_artists <- read.csv(text = url, na.strings = c("", " ", "NA", "<NA>"))[,-1] %>% 
          mutate(year_acquired = year(DateAcquired), nartists = str_count(Artist, ",") + 1) %>% 
          filter(nartists == 1) %>% 
          select(Artist, Nationality, BeginDate, EndDate, Gender, Department, year_acquired) %>%
          mutate_all(funs(gsub("[(]", "", .))) %>% 
          mutate_all(funs(gsub("[)]", "", .))) %>% 
          rename(artist = Artist, country = Nationality, department = Department,
                 gender = Gender, birth = BeginDate, death = EndDate) %>% 
          mutate(alive = (death == 0), gender = tolower(gender), department = tolower(department), country = tolower(country)) %>% 
          filter(birth != 0, !is.na(gender))
moma_artists$death[moma_artists$death == 0] <- NA
moma_artists$gender[moma_artists$gender == ""] <- NA
moma_artists <- moma_artists %>% 
          filter(!is.na(gender))


moma_artists_2 <- moma_artists %>% 
          group_by(artist) %>% 
          summarize(count = n(), year_acquired_min = min(year_acquired), 
                    year_acquired_max = max(year_acquired), department = names(which.max(table(department))))

moma <- left_join(moma_artists, moma_artists_2) %>% 
          mutate(genx = (birth >= 1965)) %>% 
          select(artist, country, birth, death, alive, genx, gender, department, 
                 count, year_acquired_min, year_acquired_max) %>% 
          distinct()  %>% 
          mutate_if(is.character, as.factor)


set.seed(109)
moma_sample <- moma %>% 
          filter(!is.na(alive), !is.na(birth), !is.na(count), !is.na(year_acquired_min)) %>% 
          sample_n(., size = 100) %>% 
          select(-department)



usethis::use_data(moma, overwrite = TRUE)
usethis::use_data(moma_sample, overwrite = TRUE)