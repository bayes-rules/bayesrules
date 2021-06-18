#' Himalayan Climber Data
#' 
#' A sub-sample of the Himalayan Database distributed through the R for Data Science TidyTuesday project. This dataset includes information on the results and conditions for various Himalayan climbing expeditions. Each row corresponds to a single member of a climbing expedition team.
#' 
#' @format A data frame with 2076 observations (1 per climber) and 22 variables:
#' \describe{
#'   \item{expedition_id}{unique expedition identifier}
#'   \item{member_id}{unique climber identifier}
#'   \item{peak_id}{unique identifier of the expedition's destination peak}
#'   \item{peak_name}{name of the expedition's destination peak}
#'   \item{year}{year of expedition}
#'   \item{season}{season of expedition (Autumn, Spring, Summer, Winter)}
#'   \item{sex}{climber gender identity which the database oversimplifies to a binary category}
#'   \item{age}{climber age}
#'   \item{citizenship}{climber citizenship}
#'   \item{expedition_role}{climber's role in the expedition (eg: Co-Leader)}
#'   \item{hired}{whether the climber was a hired member of the expedition}
#'   \item{highpoint_metres}{the destination peak's highpoint (metres)}
#'   \item{success}{whether the climber successfully reached the destination}
#'   \item{solo}{whether the climber was on a solo expedition}
#'   \item{oxygen_used}{whether the climber utilized supplemental oxygen}
#'   \item{died}{whether the climber died during the expedition}
#'   \item{death_cause}{}
#'   \item{death_height_metres}{}
#'   \item{injured}{whether the climber was injured on the expedition}
#'   \item{injury_type}{}
#'   \item{injury_height_metres}{}
#'   \item{count}{number of climbers in the expedition}
#'   \item{height_metres}{height of the peak in meters}
#'   \item{first_ascent_year}{the year of the first recorded summit of the peak (though not necessarily the actual first summit!)}
#'   }
#' @source Original source: \url{https://www.himalayandatabase.com/}. Complete dataset distributed by: \url{https://github.com/rfordatascience/tidytuesday/tree/master/data/2020/2020-09-22/}.
"climbers_sub"
