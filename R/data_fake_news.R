#' A collection of 150 news articles
#'
#' A dataset containing data behind the study
#' "FakeNewsNet: A Data Repository with News Content, Social Context and Spatialtemporal Information for Studying Fake News on Social Media"
#' \url{https://arxiv.org/abs/1809.01286}.
#'
#' @format A data frame with 150 rows and 6 variables:
#' \describe{
#'   \item{title}{The title of the news article}
#'   \item{text}{Text of the article}
#'   \item{url}{Hyperlink for the article}
#'   \item{authors}{Authors of the article}
#'   \item{type}{Binary variable indicating whether the article presents fake or real news(fake, real)}
#'   \item{title_exclamation}{Binary variable indicating whether the title of the article includes an exlamation point or not(TRUE, FALSE)}
#' }
#' @source Shu, K., Mahudeswaran, D., Wang, S., Lee, D. and Liu, H. (2018) FakeNewsNet: A Data Repository with News Content, Social Context and Dynamic Information for Studying Fake News on Social Media
"fake_news"
