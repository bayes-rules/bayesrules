
#' @title Plot Beta Prior/Posterior for \eqn{\pi} 
#'
#' @description Plots the Probability Density Function for Beta Prior/Posterior \eqn{\pi} which represents the probability of success in a Binomial likelihood.
#'
#' @param alpha,beta non-negative parameters of the Beta distribution
#' @param mean,mode provides choices whether to display the mean and the mode of the distribution  
#'
#' @return A density plot for the Beta distribution.
#' @export
#' @import ggplot2
#'
#' @examples
#' plot_beta(alpha = 1, beta = 12)
plot_beta <- function(alpha, beta, mean = FALSE, mode = FALSE){
  
  
  p <- ggplot(data = data.frame(x = c(0, 1)),
              aes(x)) +
    stat_function(fun = dbeta,
                  n = 101,
                  args = list(shape1 = alpha,
                              shape2=beta)) +
    labs(x = expression(pi),
         y = expression(paste("f(",pi,")")))

  
  if (mean == TRUE & mode == FALSE){
    mean <- alpha / (alpha + beta)
    
    p <- p +
      geom_segment(aes(x = mean, y = 0, 
                       xend = mean, 
                       yend = dbeta(mean, alpha, beta),
                       linetype = "mean")) +
      scale_linetype_manual(values = c(mean = "solid")) +
      theme(legend.title = element_blank())
  }
  
  if (mean == FALSE & mode == TRUE){
    mode <- (alpha - 1)/(alpha + beta - 2)
    
    p <- p +
      geom_segment(aes(x = mode, y = 0, 
                       xend = mode, 
                       yend = dbeta(mode, alpha, beta), 
                       linetype = "mode"))+
      scale_linetype_manual(values = c(mode = "dashed")) +
      theme(legend.title = element_blank())
    
    
  }
  
  if (mean == TRUE & mode == TRUE){
    mean <- alpha / (alpha + beta)
    mode <- (alpha - 1)/(alpha + beta - 2)
    
    
    p <- p +
      geom_segment(aes(x = mean, y = 0, 
                       xend = mean, 
                       yend = dbeta(mean, alpha, beta),
                       linetype = "mean")) +
      geom_segment(aes(x = mode, y = 0, 
                       xend = mode, 
                       yend = dbeta(mode, alpha, beta), 
                       linetype = "mode"))+
      scale_linetype_manual(values = c(mean = "solid", mode = "dashed")) +
      theme(legend.title = element_blank())
  }
p
}

