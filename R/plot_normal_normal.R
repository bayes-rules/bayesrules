#' Plot Normal-Normal Models
#'
#' @param mean prior mean
#' @param sd prior standard deviation
#' @param sigma likelihood standard deviation
#' @param x_bar sample mean of the data
#' @param n sample size of the data
#' @param prior a logical value indicating whether the prior model should be plotted.
#' @param likelihood a logical value indicating whether the scaled likelihood should be plotted.
#' @param posterior a logical value indicating whether posterior model should be plotted.
#'
#' @return a ggplot
#' @export
#' @import ggplot2
#' @examples
#' 
#' plot_normal_normal(mean = 0, sd = 3, sigma= 4, x_bar = 5, n = 3)
#' plot_beta_binomial(mean = -1, sd = 5, sigma= 4, x_bar = 5, n = 3, posterior = FALSE)

plot_normal_normal <- function (mean, 
                                     sd, 
                                     sigma = NULL,
                                     x_bar = NULL, 
                                     n = NULL,
                                     prior = TRUE,
                                     likelihood = TRUE,
                                     posterior = TRUE)
{
  if (is.null(x_bar) | is.null(n)|is.null(sigma))
    warning("To plot the posterior, 
            specify sigma for the likelihood, data xbar and n")
  
  
      post_mean <- (((sigma^2)*mean) + ((sd^2)*n*x_bar))/(n*(sd^2)+(sigma^2))
      post_var <- ((sigma^2)*(sd^2))/(n*(sd^2)+(sigma^2))
      
      
      x <- c(min(c(mean - 4*sd, x_bar-4*sigma/sqrt(n))) , 
             max(c(mean + 4*sd, x_bar+4*sigma/sqrt(n))))
      
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
      if (!is.null(x_bar) & !is.null(n) & !is.null(sigma) & (likelihood != FALSE)) {
        g <- g +
          stat_function(fun = dnorm,
                        args = list(mean = x_bar,
                                    sd = sigma/sqrt(n))) +
          stat_function(fun = dnorm,
                        args = list(mean = x_bar,
                                    sd = sigma/sqrt(n)),
                        geom = "area",
                        alpha = 0.5,
                        aes(fill = "(scaled) likelihood"))
      }
      if (!is.null(x_bar) & !is.null(n) & !is.null(sigma) & posterior == TRUE) {
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
    
    
    

  
  
