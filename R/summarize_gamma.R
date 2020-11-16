#' @title Summarize a Gamma Model for \eqn{\lambda}
#' 
#' @description Summarizes the expected value, variance, and mode of 
#' a Gamma(shape, rate) model for variable \eqn{\lambda}.
#'
#' @param shape non-negative shape parameter of the Gamma model
#' @param rate non-negative rate parameter of the Gamma model
#'
#' @return a summary table
#' @export
#'
#' @examples
#' \dontrun{
#' summarize_gamma(1, 15)
#' }

summarize_gamma <- function (shape, rate){

  mean <- shape/rate
  
  if (shape >= 1){
    mode <- (shape - 1)/rate
  } else {
    mode <- NA
  }
  var <- shape/rate^2
  
 data.frame(mean = mean,
            mode = mode,
            var = var)
  
 
}# end of function
