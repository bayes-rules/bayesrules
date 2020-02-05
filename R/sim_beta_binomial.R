#' Simulate Beta Binomial - RStan wrap
#'
#' @param alpha,beta shape parameters of the prior Beta distribution.
#' @param x number of successes
#' @param n number of trials
#' @param chains number of chains
#' @param iter number of iterations
#'
#' @return
#' @export
#' @import rstan
#'
#' @examples
sim_beta_binomial <- function(alpha, beta, x, n, chains = 4, iter = 1000){
  beta_bin_model <- "
    data {
      real<lower=0> alpha;
      real<lower=0> beta;
      int<lower=1> n;
      int<lower=0, upper=n> x;
    }

    parameters {
      real<lower=0, upper=1> pi;
    }

    model {
      x ~ binomial(n, pi);
      pi ~ beta(alpha, beta);
    }
  "
  stan(
    model_code = beta_bin_model,
    data = list(x = x, n = n, alpha = alpha, beta = beta),
    chains = chains, iter = iter)
}
