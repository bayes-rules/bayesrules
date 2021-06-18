#' Loon Count Data
#' 
#' Loon count data collected from the year 2000 to 2017, in late December, by birdwatchers in the Ontario, Canada area.
#' The data was made available by the Bird Studies Canada website and distributed through the R for Data Science TidyTuesday project. 
#' A more complete data set with a larger selection of birds can be found in the bird_counts data in the bayesrules package.
#' 
#' @format A data frame with 18 rows and 5 variables. Each row represents loon observations in the given year.
#' \describe{
#'   \item{year}{year of data collection}
#'   \item{count}{number of loons observed}
#'   \item{hours}{total person-hours of observation period}
#'   \item{count_per_hour}{count divided by hours}
#'   \item{count_per_100}{count_per_hour multiplied by 100 hours}
#'   }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2019/2019-06-18/bird_counts.csv}.
"loons"
