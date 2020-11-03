#' Title
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
#' @param sum_y sum of observed values for the Poisson likelihood.
#' @param n number of observations for the Poisson likelihood.
#' @param prior a logical value indicating whether the prior distribution should be plotted.
#' @param likelihood a logical value indicating whether the scaled likelihood should be plotted.
#' @param posterior a logical value indicating whether posterior distribution should be plotted.
#'
#' @return a ggplot2
#' @export
#'
#' @import ggplot2
#'
#' @examples
#' plot_gamma_poisson(shape = 100, rate = 20, sum_y = 39, n = 6)

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
