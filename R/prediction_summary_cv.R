#' Cross-Validated Posterior Predictive Summaries
#' 
#' Given a set of observed data including a quantitative response variable y 
#' and an rstanreg model of y, 
#' this function returns 4 cross-validated measures of the model's posterior prediction quality: 
#' median absolute prediction error (the typical difference between the observed y values and their posterior predictive medians),
#' scaled mae (the typical number of absolute deviations between the observed y values and their posterior predictive medians),
#' the proportion of observed y values that fall within their posterior prediction intervals, the probability levels of which are set by the user.
#'
#' @param data data frame including the variables in the model, both response y and predictors x
#' @param model an rstanreg model object with quantitative y
#' @param k the number of folds to use for cross validation
#' @param prob_inner posterior predictive interval probability (a value between 0 and 1)
#' @param prob_outer posterior predictive interval probability (a value between 0 and 1)
#'
#' @return list
#' @export
#'
#' @examples
prediction_summary_cv <- function(data, model, k = 10, prob_inner = 0.5, prob_outer = 0.95){
          # Split data into k possibly unequal folds
          # https://gist.github.com/dsparks/3695362
          random_draw <- rnorm(nrow(data))
          k_quantiles <- quantile(random_draw, 0:k/k)
          folds <- cut(random_draw, k_quantiles, include.lowest = TRUE)
          levels(folds) <- 1:k
          data <- data %>% 
                    mutate(fold = sample(folds, size = length(folds), replace = FALSE))
          y <- model$terms[[2]]
          
          # Test the model on each one of the k folds
          folds <- data.frame()
          for(i in 1:k){
                    data_train <- data %>% 
                              filter(fold != i) %>% 
                              dplyr::select(-fold)
                    data_test <- data %>% 
                              filter(fold == i) %>% 
                              dplyr::select(-fold)
                    model_train <- update(model, data = data_train, refresh = FALSE)
                    predictions_test <- posterior_predict(model_train, newdata = data_test)
                    folds <- rbind(folds, prediction_summary(y = c(as.matrix((data_test %>% select(y))[,1])), yrep = predictions_test))
          }
          
          # Calculate the cross validated error
          cv <- folds %>% 
                    summarize_all(mean)
          folds <- data.frame(fold = 1:k, folds)
          return(list(folds = folds, cv = cv))
}


