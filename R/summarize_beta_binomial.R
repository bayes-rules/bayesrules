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
