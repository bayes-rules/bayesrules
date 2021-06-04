
vnames<-c("player_name", "height", "weight", "year", "team", 
          "age","games_played",
          "games_started", "avg_minutes_played", "avg_field_goals",
          "avg_field_goal_attempts", "filed_goal_pct", "avg_three_pointers",
          "avg_three_pointer_attempts", "three_pointer_pct",
          "avg_two_pointers", "avg_two_pointer_attempts", "two_pointer_pct",
          "avg_free_throws", "avg_free_throw_attempts", "free_throw_pct",
          "avg_offensive_rb", "avg_defensive_rb", "avg_rb",
          "avg_assists", "avg_steals", "avg_blocks", "avg_turnovers",
          "avg_personal_fouls", "avg_points")

names(basketball)<-vnames


basketball<-basketball %>% 
  mutate(
    weight=as.integer(weight),
    age=as.integer(age),
    year=as.integer(year),
    height=12*as.numeric(str_match(height, "(.)-(.)")[,2])+as.numeric(str_match(height, "(.)-(.)")[,3]))

