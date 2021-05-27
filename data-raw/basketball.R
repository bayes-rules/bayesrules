library(robotstxt)
library(tidyverse)
library(rvest)


robotstxt::paths_allowed("http://www.basketball-reference.com")
robotstxt::paths_allowed("http://www.wnba.com")

year <- 2019

get_player_urls <- function(letter){
  paste0("https://www.basketball-reference.com/wnba/players/", letter) %>% 
    read_html() %>% 
    html_nodes("#content strong+ a") %>% 
    html_attr(name = "href") %>% 
    print()
}

all_players <- map(letters, get_player_urls) %>% 
  unlist()
  

#all_players <- read_html("https://www.basketball-reference.com/wnba/players/b/")

# all_players <- all_players %>% 
#   html_nodes("#content strong+ a") %>% 
#   html_attr(name = "href")

# player_url <- all_players[i]

get_player_info <- function(player_url){
  
  player_page <- paste0("https://www.basketball-reference.com/", player_url) %>% 
    read_html()
  
 per_game_stat <- player_page %>% 
   html_table("#per_game", header = NA)
 
 per_game_stat <- as_tibble(per_game_stat[[1]]) %>% 
   slice(-nrow(per_game_stat[[1]])) 
 
 per_game_year <- per_game_stat %>% 
   filter(Year == year)
 
 
 if(nrow(per_game_year != 0)){
   
   per_game_stat <- per_game_stat %>% 
     filter(Year == year) 
     
   
   player_name <- player_page %>%  
     html_node("#meta span") %>% 
     html_text() %>% 
     str_remove(" WNBA Stats")
   
   height <- player_page %>% 
     html_node("[itemprop='height']") %>% 
     html_text()
   
   weight <- player_page %>% 
     html_node("[itemprop='weight']") %>% 
     html_text() %>% 
     str_remove("lb")
   
   tibble(player_name = player_name,
          height = height,
          weight = weight) %>% 
     bind_cols(per_game_stat)
 } # end of if statement


 
} #end of get_player_info function


basketball <- map_df(all_players, get_player_info)

usethis::use_data(basketball, overwrite = TRUE)


