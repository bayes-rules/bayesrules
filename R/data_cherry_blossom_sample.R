#' Cherry Blossom Running Race
#' 
#' A sub-sample of outcomes for the annual Cherry Blossom Ten Mile race in Washington, D.C.. This sub-sample was taken from the complete Cherry data in the mdsr package.
#' 
#' @format A data frame with 252 Cherry Blossom outcomes and 7 variables:
#' \describe{
#'   \item{runner}{a unique identifier for the runner}
#'   \item{age}{age of the runner}
#'   \item{net}{time to complete the race, from starting line to finish line (minutes)}
#'   \item{gun}{time between the official start of the of race and the finish line (minutes)}
#'   \item{year}{year of the race}
#'   \item{previous}{the number of previous years in which the subject ran in the race}
#'   }
#' @source Data in the original Cherry data set were obtained from \url{https://www.cherryblossom.org/post-race/race-results/}.
"cherry_blossom_sample"
