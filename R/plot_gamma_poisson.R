#' Plot a Gamma-Poisson Bayesian Model
#'
#' Consider a Gamma-Poisson Bayesian model for rate parameter \eqn{\lambda} with 
#' a Gamma(shape, rate) prior on \eqn{\lambda} and a Poisson likelihood for the data. 
#' Given information on the prior (shape and rate) 
#' and data (the sample size n and sum_y),
#' this function produces a plot of any combination of the corresponding prior pdf, 
#' scaled likelihood function, and posterior pdf.  All three are included by default.
#' 
#' @param shape non-negative shape parameter of the Gamma prior
#' @param rate non-negative rate parameter of the Gamma prior
#' @param sum_y sum of observed data values for the Poisson likelihood
#' @param n number of observations for the Poisson likelihood
#' @param prior a logical value indicating whether the prior model should be plotted.
#' @param likelihood a logical value indicating whether the scaled likelihood should be plotted.
#' @param posterior a logical value indicating whether posterior model should be plotted.
#'
#' @return a ggplot
#' @export
#'
#' @import ggplot2
#' @importFrom stats dgamma qgamma
#'
#' @examples
#' plot_gamma_poisson(shape = 100, rate = 20, sum_y = 39, n = 6)
#' plot_gamma_poisson(shape = 100, rate = 20, sum_y = 39, n = 6, posterior = FALSE)

plot_gamma_poisson <- function (shape, rate,
                                sum_y = NULL,
                                n = NULL,
                                prior = TRUE,
                                likelihood = TRUE,
                                posterior = TRUE){
  
  if (is.null(sum_y) | is.null(n))
    warning("To visualize the posterior,
            specify information about the data: sum_y and n")
  
 
  
  x_min <- min(qgamma(1e-05, shape, rate),
               qgamma(1e-05,
                      shape + sum_y,
                      rate + n),
               qgamma(1e-05, sum_y + 1, n))
  x_max <- max(qgamma(0.99999, shape, rate),
               qgamma(0.99999, shape + sum_y,
                      rate + n),
               qgamma(0.99999, sum_y + 1, n))
  g <- ggplot(data = data.frame(x = c(x_min, x_max)), aes(x)) +
    labs(x = expression(lambda),
         y = "density") +
    scale_fill_manual("",
                      values = c(prior = "#f0e442",
                                 `(scaled) likelihood` = "#0071b2",
                                 posterior = "#009e74"),
                      breaks = c("prior",
                                 "(scaled) likelihood",
                                 "posterior"))

  if (prior == TRUE) {
    g <- g + stat_function(fun = dgamma,
                           args = list(shape = shape,
                                       rate = rate)) +
      stat_function(fun = dgamma,
                    args = list(shape = shape,
                                rate = rate),
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "prior"))
  }

  if (!is.null(sum_y) & !is.null(n)) {
    shape_post <- shape + sum_y
    rate_post <- rate + n
    like_scaled <- function(x) {
      dgamma(x, shape = sum_y + 1, rate = n)
    }
  }
  if (!is.null(sum_y) & !is.null(n) & (likelihood != FALSE)) {
    g <- g +
      stat_function(fun = like_scaled) +
      stat_function(fun = like_scaled,
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "(scaled) likelihood"))
  }
  if (!is.null(sum_y) & !is.null(n) & posterior == TRUE) {
    g <- g +
      stat_function(fun = dgamma,
                    args = list(shape = shape_post,
                                rate = rate_post)) +
      stat_function(fun = dgamma,
                    args = list(shape = shape_post,
                                rate = rate_post),
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "posterior"))
  }
  g
}
