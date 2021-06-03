#' Plot a Normal-Normal Bayesian model
#' 
#' Consider a Normal-Normal Bayesian model for mean parameter \eqn{\mu} with 
#' a N(mean, sd^2) prior on \eqn{\mu} and a Normal likelihood for the data. 
#' Given information on the prior (mean and sd) 
#' and data (the sample size n, mean y_bar, and standard deviation sigma),
#' this function produces a plot of any combination of the corresponding prior pdf, 
#' scaled likelihood function, and posterior pdf.  All three are included by default.
#'
#' @param mean mean of the Normal prior
#' @param sd standard deviation of the Normal prior
#' @param sigma standard deviation of the data, or likelihood standard deviation
#' @param y_bar sample mean of the data
#' @param n sample size of the data
#' @param prior a logical value indicating whether the prior model should be plotted
#' @param likelihood a logical value indicating whether the scaled likelihood should be plotted
#' @param posterior a logical value indicating whether posterior model should be plotted
#'
#' @return a ggplot
#' @export
#' @import ggplot2
#' @importFrom stats dnorm
#' @examples
#' plot_normal_normal(mean = 0, sd = 3, sigma= 4, y_bar = 5, n = 3)
#' plot_normal_normal(mean = 0, sd = 3, sigma= 4, y_bar = 5, n = 3, posterior = FALSE)
plot_normal_normal <- function (mean, 
                                     sd, 
                                     sigma = NULL,
                                     y_bar = NULL, 
                                     n = NULL,
                                     prior = TRUE,
                                     likelihood = TRUE,
                                     posterior = TRUE)
{
  if (is.null(y_bar) | is.null(n)|is.null(sigma))
    warning("To plot the posterior, 
            specify sigma for the likelihood, data ybar and n")
  
  
      post_mean <- (((sigma^2)*mean) + ((sd^2)*n*y_bar))/(n*(sd^2)+(sigma^2))
      post_var <- ((sigma^2)*(sd^2))/(n*(sd^2)+(sigma^2))
      
      
      x <- c(min(c(mean - 4*sd, y_bar-4*sigma/sqrt(n))) , 
             max(c(mean + 4*sd, y_bar+4*sigma/sqrt(n))))
      
      g<-ggplot(data = data.frame(x = x), aes(x)) +
        labs(x = expression(mu),
             y = "density") +
        scale_fill_manual("",
                          values = c(prior = "#f0e442",
                                     `(scaled) likelihood` = "#0071b2",
                                     posterior = "#009e74"),
                          breaks = c("prior",
                                     "(scaled) likelihood",
                                     "posterior"))
        
      if (prior == TRUE) {
        g <- g +
          stat_function(fun = dnorm,
                        args = list(mean = mean,
                                    sd = sd)) +
          stat_function(fun = dnorm,
                        args = list(mean = mean,
                                    sd = sd),
                        geom = "area",
                        alpha = 0.5,
                        aes(fill = "prior"))
      }
      if (!is.null(y_bar) & !is.null(n) & !is.null(sigma) & (likelihood != FALSE)) {
        g <- g +
          stat_function(fun = dnorm,
                        args = list(mean = y_bar,
                                    sd = sigma/sqrt(n))) +
          stat_function(fun = dnorm,
                        args = list(mean = y_bar,
                                    sd = sigma/sqrt(n)),
                        geom = "area",
                        alpha = 0.5,
                        aes(fill = "(scaled) likelihood"))
      }
      if (!is.null(y_bar) & !is.null(n) & !is.null(sigma) & posterior == TRUE) {
        g <- g +
          stat_function(fun = dnorm,
                        args = list(mean = post_mean,
                                    sd = sqrt(post_var))) +
          stat_function(fun = dnorm,
                        args = list(mean = post_mean,
                                    sd = sqrt(post_var)),
                        geom = "area", alpha = 0.5,
                        aes(fill = "posterior"))
      }
     
      
     g 
}
