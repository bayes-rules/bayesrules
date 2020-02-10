#' Plot Normal Prior/Posterior
#'
#' @param mean mean
#' @param sd  standard deviation 
#'
#' @return
#' @export
#' @import ggplot2
#'
#' @examples
plot_normal <- function(mean, sd){
  x <- c(mean - 4*sd, mean +4*sd)
  
  ggplot(data = data.frame(x = x),
         aes(x)) +
    stat_function(fun = dnorm,
                  n = 101,
                  args = list(mean = mean,
                              sd = sd)) +
    labs(x = expression(theta),
         y = expression(paste("f(",theta,")")))
}