#' Plot Gamma Prior/Posterior
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
#' @param lambda A range of non-negative values for the Gamma distribution.
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
                       lambda = c(0, 3),
                       mean = FALSE,
                       mode = FALSE){
  
  
  p <- ggplot(data = data.frame(x = lambda),
         aes(x)) +
    stat_function(fun = dgamma,
                  n = 101,
                  args = list(shape = shape,
                              rate = rate)) +
    labs(x = expression(lambda),
         y = expression(paste("f(",lambda,")")))
}
