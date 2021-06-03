#' @title Plot a Normal Likelihood Function
#' 
#' @description Plots the Normal likelihood function for variable \eqn{\mu}
#' given a vector of Normal data y.
#' 
#' @param y vector of observed data
#' @param sigma optional value for assumed standard deviation of y. by default, this is calculated by the sample standard deviation of y.
#' 
#' @return a ggplot of Normal likelihood
#' @export
#' 
#' @import ggplot2
#' @importFrom stats dnorm
#' 
#' @examples
#' plot_normal_likelihood(y = rnorm(50, mean = 10, sd = 2), sigma = 1.5)

plot_normal_likelihood <- function(y, sigma = NULL){
  y_bar <- mean(y)
  y_sd  <- sd(y)
  n     <- length(y)
  
  if(!is.null(sigma)){y_sd <- sigma}
  
  like_fun <- function(x){prod(dnorm(y, mean = x, sd = y_sd))}
  
  plot_data <- data.frame(mu = seq(y_bar - 4*y_sd/sqrt(n), 
                                   y_bar + 4*y_sd/sqrt(n), 
                                   length = 100)) %>% 
    
    mutate(likelihood = Vectorize(like_fun)(mu))
  
  ggplot(plot_data, aes(x = mu, y = likelihood)) +
    geom_line() +
    labs(x = expression(mu), 
         y = expression(paste("L(",mu,"|(Y=y))", sep = "")))
}
