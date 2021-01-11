# Import from tidytuesday

library(zipcodeR)
data(zip_code_db)
zips <- zip_code_db %>% 
          mutate(zip = as.numeric(zipcode)) %>% 
          select(zip, state, population_density) %>% 
          rename(zip_population_density = population_density) %>% 
          mutate(zip_population_density = zip_population_density / 1000)

pizza_ratings <- readr::read_csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-01/pizza_barstool.csv") %>% 
          select(-country, -review_stats_dave_count, -contains("review_stats_all"), 
                 -contains("total"), -contains("provider")) %>% 
          rename(address = address1, community_review_count = review_stats_community_count, community_avg_rating = review_stats_community_average_score,
                 critic_review_count = review_stats_critic_count, critic_rating = review_stats_critic_average_score,
                 dave_rating = review_stats_dave_average_score) %>% 
          mutate(community_avg_rating = replace(community_avg_rating, community_review_count == 0, NA),
                 critic_rating = replace(critic_rating, critic_review_count == 0, NA)) %>% 
          select(-critic_review_count) %>% 
          left_join(., zips)

pizza_ratings <- pizza_ratings[,c(1,12,3,4,13,2,5:11)]

usethis::use_data(pizza_ratings, overwrite = TRUE)
