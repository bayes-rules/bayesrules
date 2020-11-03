#' @title Plot Binomial Likelihood 
#' @param y number of successes  
#' @param n number of trials
#' @param mle a logical value indicating whether maximum likelihood estimate should be plotted
#' @return
#' @export
#' 
#' @import magrittr
#' @importFrom dplyr filter
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

