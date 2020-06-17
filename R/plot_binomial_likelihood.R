#' @title Plot Binomial Likelihood 
#'
#' @param x number of successes  
#' @param n number of trials
#' @param mle a logical value indicating whether maximum likelihood estimation should be plotted
#' @param pi support of pi
#' @return
#' @export
#' 
#' @import magrittr
#' @importFrom dplyr filter
#' @examples
#' \dontrun{
#' plot_binomial_likelihood(x = 3, n = 10, mle = TRUE)
#' }

plot_binomial_likelihood <-function(x, 
                                    n, 
                                    mle = FALSE){
  
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
  
}# end of function

