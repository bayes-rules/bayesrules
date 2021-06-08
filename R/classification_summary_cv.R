#' Cross-Validated Posterior Classification Summaries
#'
#' Given a set of observed data including a binary response variable y 
#' and an rstanreg model of y, 
#' this function returns cross validated estimates of the model's posterior classification quality:
#' sensitivity, specificity, and overall accuracy.
#' For hierarchical models of class lmerMod, the folds are comprised by collections of groups, not individual observations.
#' 
#' @param model an rstanreg model object with binary y
#' @param data data frame including the variables in the model, both response y (0 or 1) and predictors x
#' @param group a character string representing the name of the factor grouping variable, ie. random effect (only used for hierarchical models)
#' @param k the number of folds to use for cross validation
#' @param cutoff probability cutoff to classify a new case as positive
#'
#' @return a list
#' @export
#' @import janitor dplyr groupdata2
#' @importFrom stats na.omit rnorm quantile update
#' @importFrom groupdata2 fold
#'
#' @examples
#' x <- rnorm(20)
#' z <- 3*x
#' prob <- 1/(1+exp(-z))
#' y <- rbinom(20, 1, prob)
#' example_data <- data.frame(x = x, y = y)
#' example_model <- rstanarm::stan_glm(y ~ x, data = example_data, family = binomial)
#' classification_summary_cv(model = example_model, data = example_data, k = 2, cutoff = 0.5)                   

classification_summary_cv <- function(model, data, group, k, cutoff = 0.5){
          if(!("stanreg" %in% class(model))){ stop("the model must be a stanreg object.")}
          
          data <- data %>% 
                    ungroup()
          
          # For hierarchical models, define folds from groups, not individual observations
          
          if("lmerMod" %in% class(model)){
                    # For hierarchical models, each fold is a group
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
          }
          
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
                    folds <- rbind(folds, classification_summary(model = model_train, data = data_test, cutoff = cutoff)$accuracy_rates[,1])
          }
          names(folds) <- c("sensitivity", "specificity", "overall_accuracy")
          cv <- folds %>% 
                    summarize_all(mean)
          folds <- data.frame(fold = 1:k, folds)
          return(list(folds = folds, cv = cv))
}
