#' @title Summarize Beta Trends
#' 
#' @description Summarizes the expected value, variance, and mode of the Beta distribution 
#'
#' @param alpha,beta shape parameters of the  Beta distribution.

#'
#' @return a summary table
#' @export
#'
#' @examples
#' \dontrun{
#' summarize_beta_binomial(1, 15)
#' }

summarize_beta <- function (alpha, 
                                     beta)
{

  mean <- alpha / (alpha + beta)
  mode <- (alpha - 1)/(alpha + beta - 2)
  var <-  alpha * beta / ((alpha + 
                             beta)^2 * (alpha + 
                                          beta + 1)) 
  return(data.frame(mean = mean,
                    mode = mode,
                    var = var))
  
 
}# end of function
