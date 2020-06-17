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
#'
#' @examples
plot_binomial_likelihood <-function(x, 
                                    n, 
                                    mle = FALSE,
                                    pi = seq(0, 1, by = 0.05)){
  
  message("Note that this function shows discrete values of pi.
          You can trick it into making it look more like continuous by defining a better argument for pi")


  lhood <- dbinom(x = x, size = n, prob = pi)
  
  data <-data.frame(likelihood = lhood, pi = pi)
  
  max_data <- data %>% 
    dplyr::filter(likelihood == max(likelihood))
  
  g <- data %>% 
    ggplot(aes(x = pi, y = lhood)) +
    
    geom_point() +
    
    geom_segment(data = data, 
                 x = pi, 
                 xend = pi, 
                 y = 0, 
                 yend = lhood) +
    
    labs(x = expression(pi),
         y = expression(paste("L(",pi,"|(X=", x, "))")))
  
  
  
  if (mle == TRUE){
    g <- g +
      geom_segment(aes(x = max_data$pi, 
                       xend = max_data$pi, 
                       y = 0, 
                       yend = max_data$likelihood, 
                       color ="red")) +
      theme(legend.position = "none") 
    
    
  }
  
  g
  
} # end of function

