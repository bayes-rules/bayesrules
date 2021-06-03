#' @title Summarize a Gamma Model for \eqn{\lambda}
#' 
#' @description Summarizes the expected value, variance, and mode of 
#' a Gamma(shape, rate) model for variable \eqn{\lambda}.
#'
#' @param shape positive shape parameter of the Gamma model
#' @param rate positive rate parameter of the Gamma model
#'
#' @return a summary table
#' @export
#'
#' @examples
#' summarize_gamma(shape = 1, rate = 15)
#' 

summarize_gamma <- function (shape, rate){

  mean <- shape/rate
  
  if (shape >= 1){
    mode <- (shape - 1)/rate
  } else {
    mode <- NA
  }
  var <- shape/rate^2
  sd  <- sqrt(var)
  
 data.frame(mean = mean,
            mode = mode,
            var = var,
            sd = sd)
  
 
}# end of function
