% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_normal_likelihood.R
\name{plot_normal_likelihood}
\alias{plot_normal_likelihood}
\title{Plot a Normal Likelihood Function}
\usage{
plot_normal_likelihood(y, sigma = NULL)
}
\arguments{
\item{y}{vector of observed data}

\item{sigma}{optional value for assumed standard deviation of y. by default, this is calculated by the sample standard deviation of y.}
}
\value{
a ggplot of Normal likelihood
}
\description{
Plots the Normal likelihood function for variable \eqn{\mu}
given a vector of Normal data y.
}
\examples{
plot_normal_likelihood(y = rnorm(50, mean = 10, sd = 2), sigma = 1.5)
}
