#' A collection of 150 news articles
#'
#' A dataset containing data behind the study
#' "FakeNewsNet: A Data Repository with News Content, Social Context and Spatialtemporal Information for Studying Fake News on Social Media"
#' \url{https://arxiv.org/abs/1809.01286}.
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
#'   \item{anger}{Anger sentiment rating}
#'   \item{anticipation}{Anticipation sentiment rating}
#'   \item{disgust}{Disgust sentiment rating}
#'   \item{fear}{Fear sentiment rating}
#'   \item{joy}{Joy sentiment rating}
#'   \item{sadness}{Sadness sentiment rating}
#'   \item{surprise}{Surprise sentiment rating}
#'   \item{trust}{Trust sentiment rating}
#'   \item{negative}{Negative sentiment rating}
#'   \item{positive}{Positive sentiment rating}
#'   \item{text_syllables}{Number of syllables in text}
#'   \item{text_syllables_per_word}{Number of syllables per word in text}
#' }
#' @source Shu, K., Mahudeswaran, D., Wang, S., Lee, D. and Liu, H. (2018) FakeNewsNet: A Data Repository with News Content, Social Context and Dynamic Information for Studying Fake News on Social Media
"fake_news"
