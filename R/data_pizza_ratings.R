#' Pizza Ratings Data
#' 
#' Wrangled data on pizza ratings originally collected by the "One Bite by Barstool Sports" app and distributed through the R for Data Science TidyTuesday project.
#' The data includes information about the locations and ratings for pizza restaurants around the US.
#' 
#' @format A data frame with 463 rows, each corresponding to a pizza restaurant, and 13 variables on each restaurant. 
#' \describe{
#'   \item{name}{name of pizza restaurant}
#'   \item{state}{state location of restaurant}
#'   \item{city}{city location}
#'   \item{zip}{zip code location}
#'   \item{zip_population_density}{persons per square mile in zip code}
#'   \item{address}{restaurant address}
#'   \item{latitude}{restaurant latitude}
#'   \item{longitude}{restaurant longitude}
#'   \item{price_level}{0 (cheap) to 3 (expensive)}
#'   \item{community_avg_rating}{average rating among app users (presumably)}
#'   \item{community_review_count}{number of ratings among app users (presumably)}
#'   \item{critic_rating}{critic rating (source unknown)}
#'   \item{dave_rating}{the rating of "Barstool Dave", a critic for Barstool Sports}
#' }
#' @source 
#' \url{https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-10-01/pizza_barstool.csv}.
#' \url{https://github.com/tylerjrichards/Barstool_Pizza}
"pizza_ratings"
