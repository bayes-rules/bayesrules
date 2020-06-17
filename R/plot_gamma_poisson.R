#' Title
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
#' @param sum_x sum of observed values for the Poisson likelihood.
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
#' \dontrun{
#' plot_gamma_poisson(100,20, sum_x = 39, n =6)
#' }
plot_gamma_poisson <- function (shape, rate,
                                sum_x = NULL,
                                n = NULL,
                                prior = TRUE,
                                likelihood = TRUE,
                                posterior = TRUE){
  
  if (is.null(sum_x) | is.null(n))
    warning("To visualize the posterior,
            specify information about the data: sum_x and n")
  
 
  
  x_min <- min(qgamma(1e-05, shape, rate),
               qgamma(1e-05,
                      shape + sum_x,
                      rate + n),
               qgamma(1e-05, sum_x+1, n))
  x_max <- max(qgamma(0.99999, shape, rate),
               qgamma(0.99999, shape + sum_x,
                      rate + n),
               qgamma(0.99999, sum_x+1, n))
  g <- ggplot(NULL, aes(x = c(x_min, x_max))) +
    labs(x = expression(lambda),
         y = "density") +
    scale_fill_manual("",
                      values = c(prior = "gold1",
                                 `(scaled) likelihood` = "cyan2",
                                 posterior = "cyan4"),
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

  if (!is.null(sum_x) & !is.null(n)) {
    shape_post <- shape + sum_x
    rate_post <- rate + n
    like_scaled <- function(x) {
      dgamma(x, shape = sum_x + 1, rate = n)
    }
  }
  if (!is.null(sum_x) & !is.null(n) & (likelihood != FALSE)) {
    g <- g +
      stat_function(fun = like_scaled) +
      stat_function(fun = like_scaled,
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "(scaled) likelihood"))
  }
  if (!is.null(sum_x) & !is.null(n) & posterior == TRUE) {
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
