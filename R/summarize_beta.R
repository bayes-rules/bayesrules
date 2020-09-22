#' @title Summarize Beta Trends for \eqn{\pi} 
#' 
#' @description Summarizes the expected value, variance, and mode of \eqn{\pi} of a Beta model 
#'
#' @param alpha,beta non-negative parameters of the Beta model
#'
#' @return a summary table
#' @export
#'
#' @examples
#' summarize_beta(alpha = 1, beta = 15)


summarize_beta <- function (alpha, beta){

  mean <- alpha / (alpha + beta)
  mode <- (alpha - 1)/(alpha + beta - 2)
  var <-  alpha * beta / ((alpha + 
                             beta)^2 * (alpha + 
                                          beta + 1)) 
  return(data.frame(mean = mean,
                    mode = mode,
                    var = var))
  
 
}# end of function
