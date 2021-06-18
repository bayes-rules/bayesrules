#' Bird Counts Data
#' 
#' Bird count data collected between the years 1921 and 2017, in late December, by birdwatchers in the Ontario, Canada area.
#' The data was made available by the Bird Studies Canada website and distributed through the R for Data Science TidyTuesday project. 
#' 
#' @format A data frame with 18706 rows and 7 variables. Each row represents observations for the given bird species in the given year.
#' \describe{
#'   \item{year}{year of data collection}
#'   \item{species}{scientific name of observed bird species}
#'   \item{species_latin}{latin name of observed bird species}
#'   \item{count}{number of birds observed}
#'   \item{hours}{total person-hours of observation period}
#'   \item{count_per_hour}{count divided by hours}
#'   \item{count_per_week}{count_per_hour multiplied by 168 hours per week}
#'   }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2019/2019-06-18/bird_counts.csv/}.
"bird_counts"
