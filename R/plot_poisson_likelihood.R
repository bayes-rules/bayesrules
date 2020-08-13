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
#' 
plot_poisson_likelihood <- 
  function(sum_x, 
           n,
           mle = FALSE){
    
    x_min <- qpois(1e-25, sum_x+1, n)
    x_max <- qpois(0.99999, sum_x+1, n)
    
    likelihood <- function(x) {
      dgamma(x, shape = sum_x + 1, rate = n)
    }
    
    
    g <- ggplot(data = data.frame(x = c(x_min, x_max)), aes(x)) +
      stat_function(fun = like_scaled) +
      labs(x = expression(lambda),
           y = expression(paste("L(",lambda,"|(", x, "))")))
    

    
    g
}




    
    lambda = seq(0, lambda_upper_bound, by = 0.1)
    
    y = exp(-1*length(x)*lambda)*lambda^(sum(x))/prod(factorial(x))
    
    data <- data.frame(lambda = lambda,
                       f_lambda = 
                         rep(y, length(lambda)))
    
    g <- ggplot(data, aes(x = lambda, 
                     y = f_lambda)) +
      geom_line() +
      labs(x = expression(lambda),
           y = expression(paste("L(",lambda,"|(X=", x, "))")))
    
    g <- ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
      stat_function(fun = dbinom, args = list(x = x, size = n)) +
      labs(x = expression(pi),
           y = expression(paste("L(",pi,"|(X=", x, "))")))
    
    
    
    if (mle == TRUE){
      
      max <- x/n
      
      success <- x # the line segment does not work since x is an argument in ggplot
      
      g <- g +
        
        geom_segment(aes(x = max, 
                         xend = max, 
                         y = 0, 
                         yend = dbinom(success, n, max)),
                     color = "cyan4") +
        theme(legend.position = "none") 
      
      
    }
    
    g
    
}