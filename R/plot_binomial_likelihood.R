#' @title Plot a Binomial Likelihood Function
#' 
#' @description Plots the Binomial likelihood function for variable \eqn{\pi}
#' given y observed successes in a series of n Binomial trials.
#' 
#' @param y number of successes  
#' @param n number of trials
#' @param mle a logical value indicating whether maximum likelihood estimate of \eqn{\pi}, y/n, should be plotted
#' @return a ggplot
#' @export
#' 
#' @importFrom magrittr "%>%"
#' @import ggplot2
#' @importFrom dplyr filter
#' @importFrom stats dbinom
#' @examples
#' plot_binomial_likelihood(y = 3, n = 10, mle = TRUE)

plot_binomial_likelihood <-function(y, 
                                    n, 
                                    mle = FALSE){
  
  g <- ggplot(data = data.frame(x = c(0, 1)), aes(x)) +
    stat_function(fun = dbinom, args = list(x = y, size = n)) +
    labs(x = expression(pi),
         y = expression(paste("L(",pi,"|(Y=", y, "))")))
  
  
  
  if (mle == TRUE){
    
    max <- y/n
    
    success <- y # the line segment does not work since y is an argument in ggplot
    
    g <- g +
      
      geom_segment(aes(x = max, 
                       xend = max, 
                       y = 0, 
                       yend = dbinom(success, n, max)),
                   color = "cyan4") +
      theme(legend.position = "none") 
    
    
  }
  
  g
  
}# end of function

