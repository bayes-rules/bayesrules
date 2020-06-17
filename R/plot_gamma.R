#' Plot Gamma Prior/Posterior
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
#' @param lambda A range of non-negative values for the Gamma distribution.
#' @param mean,mode take logical values indicating whether mean and the mode of the distribution should be displayed. 
#'
#' @return A density plot for the Gamma distribution.
#' @export
#'
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' plot_gamma(shape = 2, rate = 11)
#' }
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
  message("Note that the support of lambda is from 0 to positive infinity 
          but for visualization purposes the x-axis shows a subset of the support.")
}
