#' Coffee Ratings Data
#' 
#' A sub-set of data on coffee bean ratings / quality originally collected by James LeDoux (jmzledoux) and distributed through the R for Data Science TidyTuesday project. 
#' 
#' @format A data frame with 1339 batches of coffee beans and 27 variables on each batch. 
#' \describe{
#'   \item{owner}{farm owner}
#'   \item{farm_name}{farm where beans were grown}
#'   \item{country_of_origin}{country where farm is}
#'   \item{mill}{where beans were processed}
#'   \item{in_country_partner}{country of coffee partner}
#'   \item{altitude_low_meters}{lowest altitude of the farm}
#'   \item{altitude_high_meters}{highest altitude of the farm}
#'   \item{altitude_mean_meters}{average altitude of the farm}
#'   \item{number_of_bags}{number of bags tested}
#'   \item{bag_weight}{weight of each tested bag}
#'   \item{species}{bean species}
#'   \item{variety}{bean variety}
#'   \item{processing_method}{how beans were processed}
#'   \item{aroma}{bean aroma grade}
#'   \item{flavor}{bean flavor grade}
#'   \item{aftertaste}{bean aftertaste grade}
#'   \item{acidity}{bean acidity grade}
#'   \item{body}{bean body grade}
#'   \item{balance}{bean balance grade}
#'   \item{uniformity}{bean uniformity grade}
#'   \item{clean_cup}{bean clean cup grade}
#'   \item{sweetness}{bean sweetness grade}
#'   \item{moisture}{bean moisture grade}
#'   \item{category_one_defects}{count of category one defects}
#'   \item{category_two_defects}{count of category two defects}
#'   \item{color}{bean color}
#'   \item{total_cup_points}{total bean rating (0 -- 100)}
#'   }
#' @source \url{https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-07-07/coffee_ratings.csv}.
"coffee_ratings"
