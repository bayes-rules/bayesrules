#' @title Plot Binomial Likelihood 
#'
#' @param x number of successes  
#' @param n number of trials
#' @param pi sample space of pi
#' @param mle a logical value indicating whether maximum likelihood estimation should be plotted
#'
#' @return
#' @export
#' 
#' @import magrittr
#'
#' @examples
plot_binomial_likelihood <-function(x, 
                                    n, 
                                    pi = seq(0, 1, by = 0.01), 
                                    mle = FALSE){
  
  likelihood <- dbinom(x = x, size = n, prob = pi)
  
  data <- data.frame(likelihood = likelihood, pi = pi)
  
  max_data <- data %>% 
    filter(likelihood == max(likelihood))
  
  g <- data %>% 
    ggplot(aes(x = pi, y = likelihood)) +
    
    geom_point() +
    
    geom_segment(data = data, 
                 x = pi, 
                 xend = pi, 
                 y = 0, 
                 yend = likelihood) +
    
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

