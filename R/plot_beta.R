
#' @title Plot Beta Prior/Posterior
#'
#' @description Plots the Probability Density Function for Beta Prior/Posterior
#'
#' @param alpha,beta non-negative parameters of the Beta distribution 
#'
#' @return A ggplot with x axis set between 0 and 1
#' @export
#'
#' @examples
#' plot_beta(1,12)

plot_beta <- function(alpha, beta){
  ggplot(data = data.frame(x = c(0, 1)),
         aes(x)) +
    stat_function(fun = dbeta,
                  n = 101,
                  args = list(shape1 = alpha,
                              shape2=beta)) +
    labs(x = expression(pi), 
         y = expression(paste("f(",pi,")")))
}

