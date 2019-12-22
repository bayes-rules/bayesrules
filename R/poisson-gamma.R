plot_poisson_gamma <- function (s, r, sum_x = NULL, n = NULL, prior = TRUE, likelihood = TRUE, posterior = TRUE){
  if (is.null(sum_x) | is.null(n))
    warning("To visualize the posterior, specify information about the data: sum_x and n")
  x_min <- min(qgamma(1e-05, s, r), qgamma(1e-05, s + sum_x,
                                           r + n))
  x_max <- max(qgamma(0.99999, s, r), qgamma(0.99999, s + sum_x,
                                             r + n))
  g <- ggplot(NULL, aes(x = c(x_min, x_max))) + labs(x = expression(lambda),
                                                     y = "density") + scale_fill_manual("", values = c(prior = "gold1",
                                                                                                       `(scaled) likelihood` = "cyan2", posterior = "cyan4"), breaks = c("prior", "(scaled) likelihood", "posterior"))
  if (prior == TRUE) {
    g <- g + stat_function(fun = dgamma, args = list(shape = s,
                                                     rate = r)) + stat_function(fun = dgamma, args = list(shape = s,
                                                                                                          rate = r), geom = "area", alpha = 0.5, aes(fill = "prior"))
  }
  if (!is.null(sum_x) & !is.null(n)) {
    shape_post <- s + sum_x
    rate_post <- r + n
    like_scaled <- function(x) {
      dgamma(x, shape = sum_x + 1, rate = n)
    }
  }
  if (!is.null(sum_x) & !is.null(n) & (likelihood != FALSE)) {
    g <- g + stat_function(fun = like_scaled) + stat_function(fun = like_scaled,
                                                              geom = "area", alpha = 0.5, aes(fill = "(scaled) likelihood"))
  }
  if (!is.null(sum_x) & !is.null(n) & posterior == TRUE) {
    g <- g + stat_function(fun = dgamma, args = list(shape = shape_post,
                                                     rate = rate_post)) + stat_function(fun = dgamma,
                                                                                        args = list(shape = shape_post, rate = rate_post),
                                                                                        geom = "area", alpha = 0.5, aes(fill = "posterior"))
  }
  g
}

summarize_poisson_gamma <- function (s, r, sum_x = NULL, n = NULL){
  if (is.null(sum_x) | is.null(n))
    warning("To summarize the posterior, specify data sum_x and n")
  if (is.null(sum_x) & is.null(n)) {
    prior_mean <- s/r
    if (s >= 1) {
      prior_mode <- (s - 1)/r
    }
    else {
      prior_mode <- NA
    }
    prior_var <- s/r^2
    return(data.frame(model = c("prior"), s = s, r = r, mean = prior_mean,
                      mode = prior_mode, var = prior_var))
  }
  else {
    prior_mean <- s/r
    if (s >= 1) {
      prior_mode <- (s - 1)/r
    }
    else {
      prior_mode <- NULL
    }
    prior_var <- s/r^2
    post_mean <- (s + sum_x)/(r + n)
    if ((s + sum_x) >= 1) {
      post_mode <- (s + sum_x - 1)/(r + n)
    }
    else {
      post_mode <- NA
    }
    post_var <- (s + sum_x)/((r + n)^2)
    post_s <- s + sum_x
    post_r <- r + n
    return(data.frame(model = c("prior", "posterior"), s = c(s,
                                                             post_s), r = c(r, post_r), mean = c(prior_mean, post_mean),
                      mode = c(prior_mode, post_mode), var = c(prior_var,
                                                               post_var)))
  }
}
