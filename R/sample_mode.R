#' Find Sample Mode
#'
#' @param x vector of sample data 
#'
#' @return sample mode 
#' @export
#'
#' @examples sample_mode(c(3,4,4))
sample_mode <- function(x){
  d <- density(x)
  d$x[which.max(d$y)]  
}