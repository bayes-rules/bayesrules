#' Museum of Modern Art (MoMA) data subset
#' 
#' A random sample of 100 media and performance artists represented in the Museum of Modern Art in New York City.
#' The data was made available by MoMA itself and downloaded in December 2020.
#' It does not include information about artist collectives or companies.
#' 
#' @format A data frame with 100 rows and 9 variables. Each row represents an individual media and performance artist in the MoMA collection.
#' \describe{
#'   \item{artist}{name}
#'   \item{county}{country of origin}
#'   \item{birth}{year of birth}
#'   \item{death}{year of death}
#'   \item{alive}{whether or not the artist was living at the time of data collection (December 2020)}
#'   \item{gender}{gender identity (as perceived by MoMA employees)}
#'   \item{count}{number of the artist's works in the MoMA collection}
#'   \item{year_acquired_min}{first year MoMA acquired one of the artist's works}
#'   \item{year_acquired_max}{most recent year MoMA acquired one of the artist's works}
#'   }
#' @source \url{https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv}.
"moma_small"