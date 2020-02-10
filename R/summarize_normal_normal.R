#' Summarize Normal-Normal
#'
#' @param mean prior mean
#' @param sd prior standard deviation
#' @param sigma likelihood standard deviation
#' @param x_bar sample mean of the data
#' @param n sample size of the data
#'
#' @return
#' @export 
#'
#' @examples
summarize_normal_normal <- function (mean, 
                                     sd, 
                                     sigma = NULL,
                                     x_bar = NULL, 
                                     n = NULL)
{
  if (is.null(x_bar) | is.null(n)|is.null(sigma))
    warning("To summarize the posterior, 
            specify sigma for the likelihood, data xbar and n")
  
  prior_mean <- mean
  prior_mode <- mean
  prior_var <- sd^2
  if (is.null(x_bar) & is.null(n) & is.null(sigma)) {
    return(data.frame(model = c("prior"), 
                      alpha = alpha,
                      beta = beta, 
                      mean = prior_mean, 
                      mode = prior_mode,
                      var = prior_var))
  }
  else {
    post_mean <- (((sigma^2)*mean) + ((sd^2)*n*x_bar))/(n*(sd^2)+(sigma^2))
    post_mode <- post_mean
    post_var <- ((sigma^2)*(sd^2))/(n*(sd^2)+(sigma^2))
    return(data.frame(model = c("prior", "posterior"), 
                      mean = c(prior_mean,
                               post_mean), 
                      mode = c(prior_mode, post_mode), 
                      var = c(prior_var,
                              post_var)))
  }
}
