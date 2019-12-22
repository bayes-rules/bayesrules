plot_beta_binomial <- function (alpha, beta, x = NULL, n = NULL, prior = TRUE, likelihood = TRUE,
                                posterior = TRUE)
{
  if (is.null(x) | is.null(n))
    warning("To visualize the posterior, specify data x and n")
  g <- ggplot(NULL, aes(x = c(0, 1))) + labs(x = expression(pi),
                                             y = "density") + scale_fill_manual("", values = c(prior = "gold1",
                                                                                               `(scaled) likelihood` = "cyan2", posterior = "cyan4"), breaks = c("prior", "(scaled) likelihood", "posterior"))
  if (prior == TRUE) {
    g <- g + stat_function(fun = dbeta, args = list(shape1 = alpha,
                                                    shape2 = beta)) + stat_function(fun = dbeta, args = list(shape1 = alpha,
                                                                                                             shape2 = beta), geom = "area", alpha = 0.5, aes(fill = "prior"))
  }
  if (!is.null(x) & !is.null(n)) {
    alpha_post <- alpha + x
    beta_post <- beta + n - x
    x_data <- x
    like_scaled <- function(x) {
      like_fun <- function(x) {
        dbinom(x = x_data, size = n, prob = x)
      }
      scale_c <- integrate(like_fun, lower = 0, upper = 1)[[1]]
      like_fun(x)/scale_c
    }
  }
  if (!is.null(x) & !is.null(n) & (likelihood != FALSE)) {
    g <- g + stat_function(fun = like_scaled) + stat_function(fun = like_scaled,
                                                              geom = "area", alpha = 0.5, aes(fill = "(scaled) likelihood"))
  }
  if (!is.null(x) & !is.null(n) & posterior == TRUE) {
    g <- g + stat_function(fun = dbeta, args = list(shape1 = alpha_post,
                                                    shape2 = beta_post)) + stat_function(fun = dbeta,
                                                                                         args = list(shape1 = alpha_post, shape2 = beta_post),
                                                                                         geom = "area", alpha = 0.5, aes(fill = "posterior"))
  }
  g
}

summarize_beta_binomial <- function (alpha, beta, x = NULL, n = NULL)
{
  if (is.null(x) | is.null(n))
    warning("To summarize the posterior, specify data x and n")
  beta_mean <- function(a, b) {
    a/(a + b)
  }
  beta_mode <- function(a, b) {
    (a - 1)/(a + b - 2)
  }
  beta_var <- function(a, b) {
    a * b/((a + b)^2 * (a + b + 1))
  }
  prior_mean <- beta_mean(alpha, beta)
  prior_mode <- beta_mode(alpha, beta)
  prior_var <- beta_var(alpha, beta)
  if (is.null(x) & is.null(n)) {
    return(data.frame(model = c("prior"), alpha = alpha,
                      beta = beta, mean = prior_mean, mode = prior_mode,
                      var = prior_var))
  }
  else {
    post_alpha <- x + alpha
    post_beta <- n - x + beta
    post_mean <- beta_mean(post_alpha, post_beta)
    post_mode <- beta_mode(post_alpha, post_beta)
    post_var <- beta_var(post_alpha, post_beta)
    return(data.frame(model = c("prior", "posterior"), alpha = c(alpha,
                                                                 post_alpha), beta = c(beta, post_beta), mean = c(prior_mean,
                                                                                                                  post_mean), mode = c(prior_mode, post_mode), var = c(prior_var,
                                                                                                                                                                       post_var)))
  }
}
