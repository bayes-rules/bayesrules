prediction_summary_data <- function(y, yrep, prob_inner = 0.5, prob_outer = 0.95){
  # Calculate summary statistics of simulated 
  # posterior predictive models for each case
  l_outer <- function(x){quantile(x, (1-prob_outer) / 2)}
  l_inner <- function(x){quantile(x, (1-prob_inner) / 2)}
  u_inner <- function(x){quantile(x, 1 - (1-prob_inner) / 2)}
  u_outer <- function(x){quantile(x, 1 - (1-prob_outer) / 2)}
  df <- data.frame(yrep) %>% 
    summarize_all(list(mean, sd, median, mad, l_outer, l_inner, u_inner, u_outer)) %>%
    unlist() %>% 
    matrix(., length(y), 8) %>% 
    data.frame()
  names(df) <- c("post_mean", "post_sd", "post_median", "post_mad", "l_outer", "l_inner", "u_inner", "u_outer")
  data.frame(cbind(y, df))
}



#' Posterior Predictive Summaries
#'
#' @param y response variable
#' @param yrep predicted reps
#' @param prob_inner posterior predictive interval probability
#' @param prob_outer posterior predictive interval probability
#'
#' @return
#' @export
#'
#' @examples
prediction_summary <- function(y, yrep, prob_inner = 0.5, prob_outer = 0.95){
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


