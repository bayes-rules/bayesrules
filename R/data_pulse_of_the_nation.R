#' Cards Against Humanity's Pulse of the Nation Survey
#' 
#' Cards Against Humanity's "Pulse of the Nation" project (\url{https://thepulseofthenation.com/}) conducted monthly polls into people's social and political views, as well as some silly things. This data includes responses to a subset of questions included in the poll conducted in September 2017.
#' 
#' @format A data frame with observations on 1000 survey respondents with 15 variables:
#' \describe{
#'   \item{income}{income in \$1000s}
#'   \item{age}{age in years}
#'   \item{party}{political party affiliation}
#'   \item{trump_approval}{approval level of Donald Trump's job performance}
#'   \item{education}{maximum education level completed}
#'   \item{robots}{opinion of how likely their job is to be replaced by robots within 10 years}
#'   \item{climate_change}{belief in climate change}
#'   \item{transformers}{the number of Transformers film the respondent has seen}
#'   \item{science_is_honest}{opinion of whether scientists are generally honest and serve the public good}
#'   \item{vaccines_are_safe}{opinion of whether vaccines are safe and protect children from disease}
#'   \item{books}{number of books read in the past year}
#'   \item{ghosts}{whether or not they believe in ghosts}
#'   \item{fed_sci_budget}{respondent's estimate of the percentage of the federal budget that is spent on scientific research}
#'   \item{earth_sun}{belief about whether the earth is always farther away from the sun in winter than in summer (TRUE or FALSE)}
#'   \item{wise_unwise}{whether the respondent would rather be wise but unhappy, or unwise but happy}
#'   }
#' @source \url{https://thepulseofthenation.com/downloads/201709-CAH_PulseOfTheNation_Raw.csv}
"pulse_of_the_nation"
