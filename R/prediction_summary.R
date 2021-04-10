prediction_summary_data <- function(y, yrep, prob_inner = 0.5, prob_outer = 0.95){
  # Calculate summary statistics of simulated 
  # posterior predictive models for each case
  l_outer <- function(x){quantile(x, (1-prob_outer) / 2)}
  l_inner <- function(x){quantile(x, (1-prob_inner) / 2)}
  u_inner <- function(x){quantile(x, 1 - (1-prob_inner) / 2)}
  u_outer <- function(x){quantile(x, 1 - (1-prob_outer) / 2)}
  our_mad <- function(x){mad(x, constant = 1)}
  df <- data.frame(yrep) %>% 
    summarize_all(list(post_mean = mean, post_sd = sd, post_median = median,
                       post_mad = our_mad, l_outer = l_outer, l_inner = l_inner, u_inner = u_inner, u_outer = u_outer)) %>%
    unlist() %>% 
    matrix(., length(y), 8) %>% 
    data.frame()
  #names(df) <- c("post_mean", "post_sd", "post_median", "post_mad", "l_outer", "l_inner", "u_inner", "u_outer")
  data.frame(cbind(y, df))
}

#' Posterior Predictive Summaries
#'
#' Given a vector of observed data on quantitative variable y 
#' and a set of posterior predictions for each y, 
#' this function returns 4 measures of the posterior prediction quality: 
#' median absolute prediction error (the typical difference between the observed y values and their posterior predictive medians),
#' scaled mae (the typical number of absolute deviations between the observed y values and their posterior predictive medians),
#' the proportion of observed y values that fall within their posterior prediction intervals, the probability levels of which are set by the user.
#' 
#' @param y vector of data on a quantitative response variable
#' @param yrep a ppd object / matrix, each column containing a set of posterior predictions for the corresponding case in y
#' @param prob_inner posterior predictive interval probability (a value between 0 and 1)
#' @param prob_outer posterior predictive interval probability (a value between 0 and 1)
#'
#' @return a tibble
#' @export
#'
#' @examples
prediction_summary <- function(y, yrep, prob_inner = 0.5, prob_outer = 0.95){
  if(sum(is.na(y)) > 0) stop('NAs are not allowed in y')
  
  # This function summarizes the predictions across all cases
  pred_data <- prediction_summary_data(y, yrep, prob_inner = prob_inner, prob_outer = prob_outer) %>% 
    mutate(error = y - post_median) %>% 
    mutate(error_scaled = error / post_mad) %>% 
    mutate(within_inner = (y >= l_inner) & (y <= u_inner)) %>% 
    mutate(within_outer = (y >= l_outer) & (y <= u_outer))
  
  
  pred_summary <- pred_data %>% 
    summarize(mae = median(abs(error)), 
              mae_scaled = median(abs(error_scaled)),
              within_inner = mean(within_inner),
              within_outer = mean(within_outer)
    )
  names(pred_summary)[3] <- paste0("within_", prob_inner*100)
  names(pred_summary)[4] <- paste0("within_", prob_outer*100)
  
  pred_summary
}
