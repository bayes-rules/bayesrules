#' Cross-Validated Posterior Predictive Summaries
#' 
#' Given a set of observed data including a quantitative response variable y 
#' and an rstanreg model of y, 
#' this function returns 4 cross-validated measures of the model's posterior prediction quality: 
#' Median absolute prediction error (mae) measures the typical difference between the observed y values and their posterior predictive medians (stable = TRUE) or means (stable = FALSE).
#' Scaled mae (mae_scaled) measures the typical number of absolute deviations (stable = TRUE) or standard deviations (stable = FALSE) that observed y values fall from their predictive medians (stable = TRUE) or means (stable = FALSE).
#' within_50 and within_90 report the proportion of observed y values that fall within their posterior prediction intervals, the probability levels of which are set by the user.
#' For hierarchical models of class lmerMod, the folds are comprised by collections of groups, not individual observations.
#' 
#' @param model an rstanreg model object with quantitative y
#' @param data data frame including the variables in the model, both response y and predictors x
#' @param group a character string representing the name of the factor grouping variable, ie. random effect (only used for hierarchical models)
#' @param k the number of folds to use for cross validation
#' @param prob_inner posterior predictive interval probability (a value between 0 and 1)
#' @param prob_outer posterior predictive interval probability (a value between 0 and 1)
#'
#' @return list
#' @export
#' @import groupdata2
#' @importFrom purrr map_df
#' @importFrom groupdata2 fold
#'
#' @examples
#' example_data <- data.frame(x = sample(1:100, 20))
#' example_data$y <- example_data$x*3 + rnorm(20, 0, 5)
#' example_model <- rstanarm::stan_glm(y ~ x,  data = example_data)
#' prediction_summary_cv(model = example_model, data = example_data, k = 2)
prediction_summary_cv <- function(data, group, model, k, prob_inner = 0.5, prob_outer = 0.95){
  # This function summarizes the predictions across all observed cases in data
  if(!("stanreg" %in% class(model))){ stop("the model must be a stanreg object.")}
  
  data <- data %>% 
    ungroup()
  
  # For hierarchical models, define folds from groups, not individual observations
  
  if("lmerMod" %in% class(model)){
    y <- as.character(model$formula)[2]
    
    data <- data %>% 
      groupdata2::fold(., k = k, id_col = paste(group)) %>% 
      rename(fold = `.folds`) %>% 
      ungroup()
    }
          
  # For non-hierarchical models, define folds from individual observations
          
  else{
    # Split data into k possibly unequal folds
    # https://gist.github.com/dsparks/3695362
    random_draw <- rnorm(nrow(data))
    k_quantiles <- quantile(random_draw, 0:k/k)
    folds <- cut(random_draw, k_quantiles, include.lowest = TRUE)
    levels(folds) <- 1:k
    data <- data %>% 
      mutate(fold = sample(folds, size = length(folds), replace = FALSE))
    y <- model$terms[[2]]
    }
  # Test the model on each one of the k folds
  
  get_folds <- function(i){
    data_train <- data %>% filter(fold != i) %>% dplyr::select(-fold)
    data_test <- data %>% filter(fold == i) %>% dplyr::select(-fold)
    model_train <- update(model, data = data_train, refresh = FALSE)
    predictions_test <- posterior_predict(model_train, newdata = data_test)
    prediction_summary(model = model_train, data = data_test, prob_inner = prob_inner, prob_outer = prob_outer)
    }
  
  folds <- map_df(1:k, get_folds)
  
  cv <- folds %>% summarize_all(mean)
  folds <- data.frame(fold = 1:k, folds)
  return(list(folds = folds, cv = cv))
}
