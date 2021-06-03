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
  names(df) <- c("post_mean", "post_sd", "post_median", "post_mad", "l_outer", "l_inner", "u_inner", "u_outer")
  data.frame(cbind(y, df))
}

#' Posterior Predictive Summaries
#'
#' Given a set of observed data including a quantitative response variable y 
#' and an rstanreg model of y, 
#' this function returns 4 measures of the posterior prediction quality.
#' Median absolute prediction error (mae) measures the typical difference between the observed y values and their posterior predictive medians (stable = TRUE) or means (stable = FALSE).
#' Scaled mae (mae_scaled) measures the typical number of absolute deviations (stable = TRUE) or standard deviations (stable = FALSE) that observed y values fall from their predictive medians (stable = TRUE) or means (stable = FALSE).
#' within_50 and within_90 report the proportion of observed y values that fall within their posterior prediction intervals, the probability levels of which are set by the user.
#' 
#' @param model an rstanreg model object with quantitative y
#' @param data data frame including the variables in the model, both response y and predictors x
#' @param prob_inner posterior predictive interval probability (a value between 0 and 1)
#' @param prob_outer posterior predictive interval probability (a value between 0 and 1)
#' @param stable TRUE returns the number of absolute deviations and FALSE returns the standard deviations that observed y values fall from their predictive medians
#'
#' @return a tibble
#' @export
#' @importFrom stats mad sd median rnorm
#'
#' @examples
#' example_data <- data.frame(x = sample(1:100, 20))
#' example_data$y <- example_data$x*3 + rnorm(20, 0, 5)
#' example_model <- rstanarm::stan_glm(y ~ x,  data = example_data)
#' prediction_summary(example_model, example_data, prob_inner = 0.6, prob_outer = 0.80, stable = TRUE)
prediction_summary <- function(model, data, prob_inner = 0.5, prob_outer = 0.95, stable = FALSE){
  # Get observed y data
  if("lmerMod" %in% class(model)){
    y_name <- as.character(model$formula)[2]
  } else {
    y_name <- model$terms[[2]]
  }
  y <- c(data %>% select(y_name))[[1]]
  if(sum(is.na(y)) > 0) stop('NAs are not allowed in y')
  
  data <- data %>% ungroup()
  
  yrep <- posterior_predict(model, newdata = data)
  
  # This function summarizes the predictions across all cases
  pred_data <- prediction_summary_data(y, yrep, prob_inner = prob_inner, prob_outer = prob_outer) %>% 
    mutate(center = post_median*(stable == TRUE) + post_mean*(stable == FALSE)) %>% 
    mutate(scale = post_mad*(stable == TRUE) + post_sd*(stable == FALSE)) %>%
    mutate(error = y - center) %>% 
    mutate(error_scaled = error / scale) %>% 
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
