#' Museum of Modern Art (MoMA) data
#' 
#' The Museum of Modern Art data includes information about the individual artists included in the collection of the Museum of Modern Art in New York City.
#' It does not include information about works for artist collectives or companies.
#' The data was made available by MoMA itself and downloaded in December 2020.
#' 
#' @format A data frame with 10964 rows and 11 variables. Each row represents an individual artist in the MoMA collection.
#' \describe{
#'   \item{artist}{name}
#'   \item{country}{country of origin}
#'   \item{birth}{year of birth}
#'   \item{death}{year of death}
#'   \item{alive}{whether or not the artist was living at the time of data collection (December 2020)}
#'   \item{genx}{whether or not the artist is Gen X or younger, ie. born during 1965 or after}
#'   \item{gender}{gender identity (as perceived by MoMA employees)}
#'   \item{department}{MoMA department in which the artist's works most frequently appear}
#'   \item{count}{number of the artist's works in the MoMA collection}
#'   \item{year_acquired_min}{first year MoMA acquired one of the artist's works}
#'   \item{year_acquired_max}{most recent year MoMA acquired one of the artist's works}
#'   }
#' @source \url{https://github.com/MuseumofModernArt/collection/blob/master/Artworks.csv/}.
"moma"