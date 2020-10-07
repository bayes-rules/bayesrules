#' @title Plot Poisson Likelihood
#'
#' @param x vector of observed data
#' @param lambda_upper_bound upper bound for lambda
#'
#' @return a ggplot of Poisson likelihood
#' @export
#' 
#' @import ggplot2
#'
#' @examples
#' plot_poisson_likelihood(x = c(4, 2, 7), lambda_upper_bound = 10)
plot_poisson_likelihood <- 
  function(x, lambda_upper_bound = 10){
    
    lambda = seq(0, lambda_upper_bound, by = 0.1)
    
    y = exp(-1*length(x)*lambda)*lambda^(sum(x))/prod(factorial(x))
    
    data <- data.frame(lambda = lambda,
                       f_lambda = 
                         rep(y, length(lambda)))
    ggplot(data, aes(x = lambda, 
                     y = f_lambda)) +
      geom_line() +
      labs(x = expression(lambda),
           y = expression(paste("L(",lambda,"|(X=", x, "))")))
    
  }