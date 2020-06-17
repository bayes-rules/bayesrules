#' @title Summarize Gamma Trends
#' 
#' @description Summarizes the expected value, variance, and mode of the Gamma distribution 
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
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
