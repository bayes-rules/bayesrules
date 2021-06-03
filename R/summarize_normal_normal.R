#' Summarize a Normal-Normal Bayesian model
#'
#' Consider a Normal-Normal Bayesian model for mean parameter \eqn{\mu} with 
#' a N(mean, sd^2) prior on \eqn{\mu} and a Normal likelihood for the data. 
#' Given information on the prior (mean and sd) 
#' and data (the sample size n, mean y_bar, and standard deviation sigma),
#' this function summarizes the mean, mode, and variance of the 
#' prior and posterior Normal models of \eqn{\mu}.
#' 
#' @param mean mean of the Normal prior
#' @param sd standard deviation of the Normal prior
#' @param sigma standard deviation of the data, or likelihood standard deviation
#' @param y_bar sample mean of the data
#' @param n sample size of the data
#'
#' @return data frame
#' @export 
#'
#' @examples
#' summarize_normal_normal(mean = 2.3, sd = 0.3, sigma = 5.1, y_bar = 128.5, n = 20)
summarize_normal_normal <- function (mean, 
                                     sd, 
                                     sigma = NULL,
                                     y_bar = NULL, 
                                     n = NULL)
{
  if (is.null(y_bar) | is.null(n)|is.null(sigma))
    warning("To summarize the posterior, 
            specify sigma for the likelihood, data ybar and n")
  
  prior_mean <- mean
  prior_mode <- mean
  prior_var <- sd^2
  prior_sd  <- sd
  if (is.null(y_bar) & is.null(n) & is.null(sigma)) {
    return(data.frame(model = c("prior"), 
                      alpha = alpha,
                      beta = beta, 
                      mean = prior_mean, 
                      mode = prior_mode,
                      var = prior_var,
                      sd = prior_sd))
  }
  else {
    post_mean <- (((sigma^2)*mean) + ((sd^2)*n*y_bar))/(n*(sd^2)+(sigma^2))
    post_mode <- post_mean
    post_var <- ((sigma^2)*(sd^2))/(n*(sd^2)+(sigma^2))
    post_sd  <- sqrt(post_var)
    return(data.frame(model = c("prior", "posterior"), 
                      mean = c(prior_mean, post_mean), 
                      mode = c(prior_mode, post_mode), 
                      var = c(prior_var, post_var),
                      sd = c(prior_sd, post_sd)))
  }
}
