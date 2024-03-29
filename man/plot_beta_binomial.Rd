% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_beta_binomial.R
\name{plot_beta_binomial}
\alias{plot_beta_binomial}
\title{Plot a Beta-Binomial Bayesian Model}
\usage{
plot_beta_binomial(
  alpha,
  beta,
  y = NULL,
  n = NULL,
  prior = TRUE,
  likelihood = TRUE,
  posterior = TRUE
)
}
\arguments{
\item{alpha, beta}{positive shape parameters of the prior Beta model}

\item{y}{observed number of successes}

\item{n}{observed number of trials}

\item{prior}{a logical value indicating whether the prior model should be plotted}

\item{likelihood}{a logical value indicating whether the scaled likelihood should be plotted}

\item{posterior}{a logical value indicating whether posterior model should be plotted}
}
\value{
a ggplot
}
\description{
Consider a Beta-Binomial Bayesian model for parameter \eqn{\pi} with 
a Beta(alpha, beta) prior on \eqn{\pi} and Binomial likelihood with n trials
and y successes. Given information on the prior (alpha and data) and data (y and n),
this function produces a plot of any combination of the corresponding prior pdf, 
scaled likelihood function, and posterior pdf.  All three are included by default.
}
\examples{

plot_beta_binomial(alpha = 1, beta = 13, y = 25, n = 50)
plot_beta_binomial(alpha = 1, beta = 13, y = 25, n = 50, posterior = FALSE)

}
