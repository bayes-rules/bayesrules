#' Summarize the Gamma-Poisson Model
#'
#' @param shape A non-negative shape parameter of the Gamma distribution.
#' @param rate A non-negative rate parameter of the Gamma distribution.
#' @param sum_x sum of observed values for the Poisson likelihood.
#' @param n number of observations for the Poisson likelihood.
#'
#' @return
#' @export
#'
#' @examples
#' #' \dontrun{
#' summarize_gamma_poisson(3, 4, 7, 12)
#' }
summarize_gamma_poisson <- function (shape,
                                     rate,
                                     sum_x = NULL,
                                     n = NULL){

  if (is.null(sum_x) | is.null(n))
    warning("To summarize the posterior,
            specify data sum_x and n")
  if (is.null(sum_x) & is.null(n)) {
    prior_mean <- shape/rate
    if (shape >= 1) {
      prior_mode <- (shape - 1)/rate
    }
    else {
      prior_mode <- NA
    }
    prior_var <- shape/rate^2
    return(data.frame(model = c("prior"),
                      shape = shape,
                      rate = rate,
                      mean = prior_mean,
                      mode = prior_mode,
                      var = prior_var))
  }
  else {
    prior_mean <- shape/rate
    if (shape >= 1) {
      prior_mode <- (shape - 1)/rate
    }
    else {
      prior_mode <- NULL
    }
    prior_var <- shape/rate^2
    post_mean <- (shape + sum_x)/(rate + n)
    if ((shape + sum_x) >= 1) {
      post_mode <- (shape + sum_x - 1)/(rate + n)
    }
    else {
      post_mode <- NA
    }
    post_var <- (shape + sum_x)/((rate + n)^2)
    post_s <- shape + sum_x
    post_r <- rate + n
    return(data.frame(model = c("prior",
                                "posterior"),
                      shape = c(shape, post_s),
                      rare = c(rate, post_r),
                      mean = c(prior_mean, post_mean),
                      mode = c(prior_mode, post_mode),
                      var = c(prior_var, post_var)))
  }
}
