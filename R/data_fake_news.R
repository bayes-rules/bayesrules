#' A collection of 150 news articles
#'
#' A dataset containing data behind the study
#' "FakeNewsNet: A Data Repository with News Content, Social Context and Spatialtemporal Information for Studying Fake News on Social Media"
#' \url{https://arxiv.org/abs/1809.01286/}.
#' The news articles in this dataset were posted to Facebook in September 2016, in the run-up to the U.S. presidential election. 
#'
#' @format A data frame with 150 rows and 6 variables:
#' \describe{
#'   \item{title}{The title of the news article}
#'   \item{text}{Text of the article}
#'   \item{url}{Hyperlink for the article}
#'   \item{authors}{Authors of the article}
#'   \item{type}{Binary variable indicating whether the article presents fake or real news(fake, real)}
#'   \item{title_words}{Number of words in the title}
#'   \item{text_words}{Number of words in the text}
#'   \item{title_char}{Number of characters in the title}
#'   \item{text_char}{Number of characters in the text}
#'   \item{title_caps}{Number of words that are all capital letters in the title}
#'   \item{text_caps}{Number of words that are all capital letters in the text}
#'   \item{title_caps_percent}{Percent of words that are all capital letters in the title}
#'   \item{text_caps_percent}{Percent of words that are all capital letters in the text}
#'   \item{title_excl}{Number of characters that are exclamation marks in the title}
#'   \item{text_excl}{Number of characters that are exclamation marks in the text}
#'   \item{title_excl_percent}{Percent of characters that are exclamation marks in the title}
#'   \item{text_excl_percent}{Percent of characters that are exclamation marks in the text}
#'   \item{title_has_excl}{Binary variable indicating whether the title of the article includes an exlamation point or not(TRUE, FALSE)}
#'   \item{anger}{Percent of words that are associated with anger}
#'   \item{anticipation}{Percent of words that are associated with anticipation}
#'   \item{disgust}{Percent of words that are associated with disgust}
#'   \item{fear}{Percent of words that are associated with fear}
#'   \item{joy}{Percent of words that are associated with joy}
#'   \item{sadness}{Percent of words that are associated with sadness}
#'   \item{surprise}{Percent of words that are associated with surprise}
#'   \item{trust}{Percent of words that are associated with trust}
#'   \item{negative}{Percent of words that have negative sentiment}
#'   \item{positive}{Percent of words that have positive sentiment}
#'   \item{text_syllables}{Number of syllables in text}
#'   \item{text_syllables_per_word}{Number of syllables per word in text}
#' }
#' @source Shu, K., Mahudeswaran, D., Wang, S., Lee, D. and Liu, H. (2018) FakeNewsNet: A Data Repository with News Content, Social Context and Dynamic Information for Studying Fake News on Social Media
"fake_news"
