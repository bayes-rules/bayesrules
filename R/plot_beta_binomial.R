#' Plot a Beta-Binomial Bayesian Model
#'
#' Consider a Beta-Binomial Bayesian model for parameter \eqn{\pi} with 
#' a Beta(alpha, beta) prior on \eqn{\pi} and Binomial likelihood with n trials
#' and y successes. Given information on the prior (alpha and beta) and data (y and n),
#' this function produces a plot of any combination of the corresponding prior pdf, 
#' scaled likelihood function, and posterior pdf.  All three are included by default.
#'
#' @param alpha,beta positive shape parameters of the prior Beta model
#' @param y observed number of successes
#' @param n observed number of trials
#' @param prior a logical value indicating whether the prior model should be plotted
#' @param likelihood a logical value indicating whether the scaled likelihood should be plotted
#' @param posterior a logical value indicating whether posterior model should be plotted
#'
#' @return a ggplot
#' @export
#' @import ggplot2
#' @importFrom stats dbeta dbinom integrate
#' @examples
#'
#' plot_beta_binomial(alpha = 1, beta = 13, y = 25, n = 50)
#' plot_beta_binomial(alpha = 1, beta = 13, y = 25, n = 50, posterior = FALSE)
#' 
plot_beta_binomial <- function (alpha,
                                beta,
                                y = NULL,
                                n = NULL,
                                prior = TRUE,
                                likelihood = TRUE,
                                posterior = TRUE){
  if (is.null(y) | is.null(n))
    warning("To visualize the posterior,
            specify data y and n")

  g <- ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
    labs(x = expression(pi),
         y = "density") +
    scale_fill_manual("",
                      values = c(prior = "#f0e442",
                                 `(scaled) likelihood` = "#0071b2",
                                 posterior = "#009e74"),
                      breaks = c("prior",
                                 "(scaled) likelihood",
                                 "posterior"))
  
  if (prior == TRUE) {
    g <- g +
      stat_function(fun = dbeta,
                           args = list(shape1 = alpha,
                                       shape2 = beta)) +
      stat_function(fun = dbeta,
                    args = list(shape1 = alpha,
                                shape2 = beta),
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "prior"))
    }

  if (!is.null(y) & !is.null(n)) {
    alpha_post <- alpha + y
    beta_post <- beta + n - y
    y_data <- y
    like_scaled <- function(x) {
      like_fun <- function(x) {
        dbinom(x = y_data, size = n, prob = x)
      }
      scale_c <- integrate(like_fun, lower = 0, upper = 1)[[1]]
      like_fun(x)/scale_c
    }
  }
  if (!is.null(y) & !is.null(n) & (likelihood != FALSE)) {
    g <- g +
      stat_function(fun = like_scaled) +
      stat_function(fun = like_scaled,
                    geom = "area",
                    alpha = 0.5,
                    aes(fill = "(scaled) likelihood"))
  }
  if (!is.null(y) & !is.null(n) & posterior == TRUE) {
    g <- g +
      stat_function(fun = dbeta,
                    args = list(shape1 = alpha_post,
                                shape2 = beta_post)) +
      stat_function(fun = dbeta,
                    args = list(shape1 = alpha_post,
                                shape2 = beta_post),
                    geom = "area", alpha = 0.5,
                    aes(fill = "posterior"))
  }
  g
} # end of function
