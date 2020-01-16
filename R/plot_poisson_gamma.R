#' Title
#'
#' @param s 
#' @param r 
#' @param sum_x 
#' @param n 
#' @param prior 
#' @param likelihood 
#' @param posterior 
#'
#' @return
#' @export
#' @import ggplot2
#'
#' @examples
plot_poisson_gamma <- function (s, r, 
                                sum_x = NULL, 
                                n = NULL, 
                                prior = TRUE, 
                                likelihood = TRUE, 
                                posterior = TRUE){
  if (is.null(sum_x) | is.null(n))
    warning("To visualize the posterior, 
            specify information about the data: sum_x and n")
  x_min <- min(qgamma(1e-05, s, r), 
               qgamma(1e-05, 
                      s + sum_x,
                      r + n))
  x_max <- max(qgamma(0.99999, s, r), 
               qgamma(0.99999, s + sum_x,
                      r + n))
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
                           args = list(shape = s,
                                       rate = r)) + 
      stat_function(fun = dgamma, 
                    args = list(shape = s,
                                rate = r), 
                    geom = "area", 
                    alpha = 0.5, 
                    aes(fill = "prior"))
  }
  
  if (!is.null(sum_x) & !is.null(n)) {
    shape_post <- s + sum_x
    rate_post <- r + n
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
