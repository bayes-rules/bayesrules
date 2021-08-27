#' @title Summarize a Beta-Binomial Bayesian model
#' 
#' @description Consider a Beta-Binomial Bayesian model for parameter \eqn{\pi} with 
#' a Beta(alpha, beta) prior on \eqn{\pi} and Binomial likelihood with n trials
#' and y successes. Given information on the prior (alpha and data) and data (y and n),
#' this function summarizes the mean, mode, and variance of the 
#' prior and posterior Beta models of \eqn{\pi}.
#' 
#' @param alpha,beta positive shape parameters of the prior Beta model
#' @param y number of successes
#' @param n number of trials
#'
#' @return a summary table
#' @export
#'
#' @examples 
#' summarize_beta_binomial(alpha = 1, beta = 15, y = 25, n = 50)
summarize_beta_binomial <- function (alpha, 
                                     beta, 
                                     y = NULL, 
                                     n = NULL)
{
  if (is.null(y) | is.null(n))
    warning("To summarize the posterior, 
            specify data y and n")
  beta_mean <- function(a, b) {
    a/(a + b)
  }
  beta_mode <- function(a, b) {
    if(a < 1 & b <1){
      mode <- "0 and 1"
    }else if (a <= 1 & b > 1){
      mode <- 0
    }else if (a > 1 & b < 1){
      mode <- 1
    }
    else{
      mode <- (a - 1)/(a + b - 2)
    }
  }
  beta_var <- function(a, b) {
    a * b/((a + b)^2 * (a + b + 1))
  }
  prior_mean <- beta_mean(alpha, beta)
  prior_mode <- beta_mode(alpha, beta)
  prior_var <- beta_var(alpha, beta)
  prior_sd  <- sqrt(prior_var)
  if (is.null(y) & is.null(n)) {
    return(data.frame(model = c("prior"), 
                      alpha = alpha,
                      beta = beta, 
                      mean = prior_mean, 
                      mode = prior_mode,
                      var = prior_var,
                      sd = prior_sd))
  }
  else {
    post_alpha <- y + alpha
    post_beta <- n - y + beta
    post_mean <- beta_mean(post_alpha, post_beta)
    post_mode <- beta_mode(post_alpha, post_beta)
    post_var  <- beta_var(post_alpha, post_beta)
    post_sd   <- sqrt(post_var)
    return(data.frame(model = c("prior", "posterior"), 
                      alpha = c(alpha, post_alpha), 
                      beta = c(beta, post_beta), 
                      mean = c(prior_mean, post_mean), 
                      mode = c(prior_mode, post_mode), 
                      var = c(prior_var, post_var),
                      sd = c(prior_sd, post_sd)))
  }
}
