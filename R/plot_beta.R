#' @title Plot a Beta Model for \eqn{\pi} 
#'
#' @description Plots the probability density function (pdf) for
#' a Beta(alpha, beta) model of variable \eqn{\pi}.
#'
#' @param alpha,beta positive shape parameters of the Beta model
#' @param mean,mode a logical value indicating whether to display the model mean and mode
#'
#' @return A density plot for the Beta model.
#' @export
#' @import ggplot2
#' @importFrom stats dbeta
#'
#' @examples
#' plot_beta(alpha = 1, beta = 12, mean = TRUE, mode = TRUE)
plot_beta <- function(alpha, beta, mean = FALSE, mode = FALSE){
  
  
  p <- ggplot(data = data.frame(x = c(0, 1)),
              aes(x)) +
    stat_function(fun = stats::dbeta,
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
                       yend = stats::dbeta(mode, alpha, beta), 
                       linetype = "mode"))+
      scale_linetype_manual(values = c(mean = "solid", mode = "dashed")) +
      theme(legend.title = element_blank())
  }
p
}

