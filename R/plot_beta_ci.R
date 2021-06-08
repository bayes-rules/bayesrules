#' @title Plot a Beta Model with Credible Interval
#'
#' @description Plots the probability density function (pdf) for a
#' Beta(alpha, beta) model of variable \eqn{\pi} with markings indicating
#' a credible interval for \eqn{\pi}.
#'
#' @param alpha,beta positive shape parameters of the Beta model
#' @param ci_level credible interval level
#'
#' @return A density plot for the Beta model
#' @export
#' @import ggplot2
#' @importFrom stats dbeta qbeta
#'
#' @examples
#' plot_beta_ci(alpha = 7, beta = 12, ci_level = 0.80)
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

