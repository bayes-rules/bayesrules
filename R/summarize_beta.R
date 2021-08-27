#' @title Summarize a Beta Model for \eqn{\pi} 
#' 
#' @description Summarizes the expected value, variance, and mode of 
#' a Beta(alpha, beta) model for variable \eqn{\pi}.
#'
#' @param alpha,beta positive shape parameters of the Beta model
#'
#' @return a summary table
#' @export
#'
#' @examples
#' summarize_beta(alpha = 1, beta = 15)


summarize_beta <- function (alpha, beta){

  mean <- alpha / (alpha + beta)
  var  <-  alpha * beta / ((alpha + beta)^2 * (alpha + beta + 1))
  sd   <- sqrt(var)
  
  if(alpha < 1 & beta <1){
    mode <- "0 and 1"
  }else if (alpha <= 1 & beta > 1){
    mode <- 0
  }else if (alpha > 1 & beta < 1){
    mode <- 1
  }
  else{
    mode <- (alpha - 1)/(alpha + beta - 2)
  }
  
  return(data.frame(mean = mean,
                    mode = mode,
                    var = var,
                    sd = sd))
  
 
}# end of function
