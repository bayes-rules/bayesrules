% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_basketball.R
\docType{data}
\name{basketball}
\alias{basketball}
\title{WNBA Basketball Data}
\format{
A data frame with 146 rows and 30 variables. Each row represents a single WNBA basketball player. The variables on each player are as follows.
\describe{
  \item{player_name}{first and last name}
  \item{height}{height in inches}
  \item{weight}{weight in pounds}
  \item{year}{year of the WNBA season}
  \item{team}{team that the WNBA player is a member of}
  \item{age}{age in years}
  \item{games_played}{number of games played by the player in that season}
  \item{games_started}{number of games the player started in that season}
  \item{avg_minutes_played}{average number of minutes played per game}
  \item{avg_field_goals}{average number of field goals per game played}
  \item{avg_field_goal_attempts}{average number of field goals attempted per game played}
  \item{field_goal_pct}{percent of field goals made throughout the season}
  \item{avg_three_pointers}{average number of three pointers per game played}
  \item{avg_three_pointer_attempts}{average number of three pointers attempted per game played}
  \item{three_pointer_pct}{percent of three pointers made throughout the season}
  \item{avg_two_pointers}{average number of two pointers made per game played}
  \item{avg_two_pointer_attempts}{average number of two pointers attempted per game played}
  \item{two_pointer_pct}{percent of two pointers made throughout the season}
  \item{avg_free_throws}{average number of free throws made per game played}
  \item{avg_free_throw_attempts}{average number of free throws attempted per game played}
  \item{free_throw_pct}{percent of free throws made throughout the season}
  \item{avg_offensive_rb}{average number of offensive rebounds per game played}
  \item{avg_defensive_rb}{average number of defensive rebounds per game played}
  \item{avg_rb}{average number of rebounds (both offensive and defensive) per game played}
  \item{avg_assists}{average number of assists per game played}
  \item{avg_steals}{average number of steals per game played}
  \item{avg_blocks}{average number of blocks per game played}
  \item{avg_turnovers}{average number of turnovers per game played}
  \item{avg_personal_fouls}{average number of personal fouls per game played. Note: after 5 fouls the player is not allowed to play in that game anymore}
  \item{avg_points}{average number of points made per game played}
  \item{total_minutes}{total number of minutes played throughout the season}
  \item{starter}{whether or not the player started in more than half of the games they played}
}
}
\source{
\url{https://www.basketball-reference.com/}
}
\usage{
basketball
}
\description{
The WNBA Basketball Data was scraped from \url{https://www.basketball-reference.com/wnba/players/} and contains information on basketball players from the 2019 season.
}
\keyword{datasets}
