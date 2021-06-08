#' Sample Mode
#' 
#' Calculate the sample mode of vector x.
#'
#' @param x vector of sample data 
#'
#' @return sample mode 
#' @export
#' @importFrom stats density
#'
#' @examples sample_mode(rbeta(100, 2, 7))
sample_mode <- function(x){
  d <- density(x)
  d$x[which.max(d$y)]  
}