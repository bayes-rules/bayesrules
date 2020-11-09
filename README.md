
<!-- README.md is generated from README.Rmd. Please edit that file -->

# bayesrules

<!-- badges: start -->

<!-- badges: end -->

bayesrules is a package to supplement the Bayes Rules\! book. It
contains datasets and functions that are used in the book. Currently it
is under development. Its current purpose is to supplement our
teaching of Bayesian courses as we continue to write our book.

## Installation

You can install the development version from Github. You would also need
to install the devtools package if you do not have it installed already.

``` r
#install.packages("devtools") 
devtools::install_github("mdogucu/bayesrules")
```

## Adding data files

- as much as it seems like you should, don't touch data folder!
- in data raw folder, create .R cleaning script. end w: usethis::use_data(___, overwrite = TRUE)
- in R folder, starting from another data template, document the data


## Documentation

To write documentation for functions & data, always end w this before pushing:

``` r
library(devtools)
document()
```

