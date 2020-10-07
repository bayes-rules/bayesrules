
#' @title Plot Beta Distribution with Credible Interval
#'
#' @description Plots the Probability Density Function for Beta Distribution with Credible Interval
#'
#' @param alpha,beta non-negative parameters of the Beta distribution
#' @param ci_level credible interval level
#'
#' @return A density plot for the Beta distribution.
#' @export
#' @import ggplot2
#'
#' @examples
#' \dontrun{
#' plot_beta(1,12)
#' }
plot_beta_ci <- function(alpha, beta, ci_level = 0.95){
  
  
  p <- ggplot(data = data.frame(x = c(0, 1)),
              aes(x)) +
    stat_function(fun = dbeta,
                  n = 101,
                  args = list(shape1 = alpha,
                              shape2=beta)) +
    labs(x = expression(pi),
         y = expression(paste("f(",pi,")")))
  
  q1  <- (1 - ci_level)/2
  q2  <- 1 - q1
  
  ci  <- qbeta(c(q1,q2), alpha, beta)
  mode <- (alpha - 1) / (alpha + beta - 2)
  marks <- c(ci, mode)
  
  ggplot(data.frame(x = c(0,1)), aes(x=x)) + 
    stat_function(fun = dbeta, 
                  args = list(alpha, beta), 
                  xlim = ci, 
                  geom = "area", 
                  fill = "lightblue") + 
    stat_function(fun = dbeta, 
                  args = list(alpha, beta)) + 
    geom_segment(data = 
                   data.frame(x = marks, 
                              y1 = c(0,0,0), 
                              y2 = dbeta(marks, alpha, beta)),
                 aes(x = x, 
                     xend = x, 
                     y = y1, 
                     yend = y2)) +
    labs(x = expression(pi), y = "density") 
  

}
