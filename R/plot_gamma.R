#' Plot Gamma Prior/Posterior
#'
#' @param alpha A non-negative shape parameter of the Gamma distribution.
#' @param beta A non-negative rate parameter of the Gamma distribution.
#' @param lambda A range of non-negative values for the Gamma distribution.
#'
#' @return A density plot for the Gamma distribution.
#' @export
#'
#' @examples
#' \dontrun{
#' plot_gamma(2,11)
#' }
plot_gamma <- function(alpha, beta, lambda = c(0, 3)){
  ggplot(data = data.frame(x = lambda),
         aes(x)) +
    stat_function(fun = dgamma,
                  n = 101,
                  args = list(shape = alpha,
                              rate = beta)) +
    labs(x = expression(lambda),
         y = expression(paste("f(",lambda,")")))
}
