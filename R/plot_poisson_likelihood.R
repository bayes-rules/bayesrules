#' @title Plot a Poisson Likelihood Function
#'
#' @description Plots the Poisson likelihood function for variable \eqn{\lambda}
#' given a vector of Poisson counts y.
#' 
#' @param y vector of observed Poisson counts
#' @param lambda_upper_bound upper bound for lambda values to display on x-axis
#'
#' @return a ggplot of Poisson likelihood
#' @export
#' 
#' @import ggplot2
#'
#' @examples
#' plot_poisson_likelihood(y = c(4, 2, 7), lambda_upper_bound = 10)
plot_poisson_likelihood <- 
  function(y, lambda_upper_bound = 10){
    
    lambda = seq(0, lambda_upper_bound, by = 0.1)
    
    ht = exp(-1*length(y)*lambda)*lambda^(sum(y))/prod(factorial(y))
    
    data <- data.frame(lambda = lambda,
                       f_lambda = 
                         rep(ht, length(lambda)))
    ggplot(data, aes(x = lambda, 
                     y = f_lambda)) +
      geom_line() +
      labs(x = expression(lambda),
           y = expression(paste("L(",lambda,"|(Y=", y, "))")))
    
  }
