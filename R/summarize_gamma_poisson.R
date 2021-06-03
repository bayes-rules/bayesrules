#' Summarize the Gamma-Poisson Model
#'
#' Consider a Gamma-Poisson Bayesian model for rate parameter \eqn{\lambda} with 
#' a Gamma(shape, rate) prior on \eqn{\lambda} and a Poisson likelihood for the data. 
#' Given information on the prior (shape and rate) 
#' and data (the sample size n and sum_y),
#' this function summarizes the mean, mode, and variance of the 
#' prior and posterior Gamma models of \eqn{\lambda}.
#' 
#' @param shape positive shape parameter of the Gamma prior
#' @param rate positive rate parameter of the Gamma prior
#' @param sum_y sum of observed data values for the Poisson likelihood
#' @param n number of observations for the Poisson likelihood
#'
#' @return data frame
#' @export
#'
#' @examples 
#' summarize_gamma_poisson(shape = 3, rate = 4, sum_y = 7, n = 12)
#' 
summarize_gamma_poisson <- function (shape,
                                     rate,
                                     sum_y = NULL,
                                     n = NULL){

  if (is.null(sum_y) | is.null(n))
    warning("To summarize the posterior,
            specify data sum_y and n")
  if (is.null(sum_y) & is.null(n)) {
    prior_mean <- shape/rate
    if (shape >= 1) {
      prior_mode <- (shape - 1)/rate
    }
    else {
      prior_mode <- NA
    }
    prior_var <- shape/rate^2
    prior_sd  <- sqrt(prior_var)
    return(data.frame(model = c("prior"),
                      shape = shape,
                      rate = rate,
                      mean = prior_mean,
                      mode = prior_mode,
                      var = prior_var,
                      sd = prior_sd))
  }
  else {
    prior_mean <- shape/rate
    if (shape >= 1) {
      prior_mode <- (shape - 1)/rate
    }
    else {
      prior_mode <- NULL
    }
    prior_var <- shape/rate^2
    prior_sd  <- sqrt(prior_var)
    post_mean <- (shape + sum_y)/(rate + n)
    if ((shape + sum_y) >= 1) {
      post_mode <- (shape + sum_y - 1)/(rate + n)
    }
    else {
      post_mode <- NA
    }
    post_var <- (shape + sum_y)/((rate + n)^2)
    post_sd  <- sqrt(post_var)
    post_s <- shape + sum_y
    post_r <- rate + n
    return(data.frame(model = c("prior",
                                "posterior"),
                      shape = c(shape, post_s),
                      rate = c(rate, post_r),
                      mean = c(prior_mean, post_mean),
                      mode = c(prior_mode, post_mode),
                      var = c(prior_var, post_var),
                      sd = c(prior_sd, post_sd)))
  }
}
