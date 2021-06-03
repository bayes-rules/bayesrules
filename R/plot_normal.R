#' @title Plot a Normal Model for \eqn{\mu} 
#'
#' @description Plots the probability density function (pdf) for a
#' Normal(mean, sd^2) model of variable \eqn{\mu}.
#' 
#' @param mean mean parameter of the Normal model
#' @param sd  standard deviation parameter of the Normal model
#'
#' @return a ggplot
#' @export
#' @import ggplot2
#' @importFrom stats dnorm
#'
#' @examples
#' plot_normal(mean = 3.5, sd = 0.5)
plot_normal <- function(mean, sd){
  x <- c(mean - 4*sd, mean +4*sd)
  
  ggplot(data = data.frame(x = x),
         aes(x)) +
    stat_function(fun = dnorm,
                  n = 101,
                  args = list(mean = mean,
                              sd = sd)) +
    labs(x = expression(mu),
         y = expression(paste("f(",mu,")")))
}
