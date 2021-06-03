#' @title Plot a Gamma Model for \eqn{\lambda} 
#'
#' @description Plots the probability density function (pdf) for
#' a Gamma(shape, rate) model of variable \eqn{\lambda}.
#' 
#' @param shape non-negative shape parameter of the Gamma model
#' @param rate non-negative rate parameter of the Gamma model
#' @param mean,mode a logical value indicating whether to display the model mean and mode
#'
#' @return A density plot for the Gamma model.
#' @export
#'
#' @import ggplot2
#' @importFrom stats dgamma
#'
#' @examples
#' plot_gamma(shape = 2, rate = 11, mean = TRUE, mode = TRUE)
#' 
plot_gamma <- function(shape, rate, 
                       mean = FALSE,
                       mode = FALSE){
  x_min <- qgamma(1e-25, shape, rate)
                
  x_max <- qgamma(0.99999, shape, rate)
               
  
  p <- ggplot(data = data.frame(x = c(x_min, x_max)),
         aes(x)) +
    stat_function(fun = dgamma,
                  n = 101,
                  args = list(shape = shape,
                              rate = rate)) +
    labs(x = expression(lambda),
         y = expression(paste("f(",lambda,")"))) 
  
  if (mean == TRUE & mode == FALSE){
    mean <- shape/rate
    
    p <- p +
      geom_segment(aes(x = mean, y = 0, 
                       xend = mean, 
                       yend = dgamma(mean, shape, rate),
                       linetype = "mean")) +
      scale_linetype_manual(values = c(mean = "solid")) +
      theme(legend.title = element_blank())
  }
  
  if (mean == FALSE & mode == TRUE){
    
    if (shape >= 1){
      mode <- (shape - 1)/rate
      
      p <- p +
        geom_segment(aes(x = mode, y = 0, 
                         xend = mode, 
                         yend = dgamma(mode, shape, rate), 
                         linetype = "mode"))+
        scale_linetype_manual(values = c(mode = "dashed")) +
        theme(legend.title = element_blank()) +
        xlim(x_min, x_max)
      
    } else {
      stop("In order to plot the mode the shape parameter must be greater than
           or equal to 1.")
      
    } # end of shape>=1 ifelse
    
  
  }
  
  if (mean == TRUE & mode == TRUE){
    
    mean <- shape/rate
    
    
    if (shape >= 1){
      mode <- (shape - 1)/rate
      
      p <- p +
        geom_segment(aes(x = mean, y = 0, 
                         xend = mean, 
                         yend = dgamma(mean, shape, rate),
                         linetype = "mean")) +
        geom_segment(aes(x = mode, y = 0, 
                         xend = mode, 
                         yend = dgamma(mode, shape, rate), 
                         linetype = "mode"))+
        scale_linetype_manual(values = c(mean = "solid", mode = "dashed")) +
        theme(legend.title = element_blank())
      
    } else {
      stop("In order to plot the mode the shape parameter must be greater than
           or equal to 1.")
      
    } # end of shape>=1 ifelse
    
  }
  
  p
  

}
