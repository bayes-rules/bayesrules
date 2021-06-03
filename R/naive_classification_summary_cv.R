#' Cross-Validated Posterior Classification Summaries for a Naive Bayes model
#'
#' Given a set of observed data including a categorical response variable y 
#' and a naiveBayes model of y, 
#' this function returns a cross validated confusion matrix by which to assess 
#' the model's posterior classification quality.
#' 
#' @param model a naiveBayes model object with categorical y
#' @param data data frame including the variables in the model
#' @param y a character string indicating the y variable in data
#' @param k the number of folds to use for cross validation
#'
#' @return a list
#' @export
#' @importFrom e1071 naiveBayes
#' @importFrom stats as.formula predict
#' @examples
#' data(penguins_bayes, package = "bayesrules")
#' example_model <- e1071::naiveBayes(species ~ bill_length_mm, data = penguins_bayes)
#' naive_classification_summary_cv(model = example_model, data = penguins_bayes, y = "species", k = 2)

naive_classification_summary_cv <- function(model, data, y, k = 10){
          if(!("naiveBayes" %in% class(model))){ stop("the model must be a naiveBayes object.")}
          
          # Split data into k possibly unequal folds
          # https://gist.github.com/dsparks/3695362
          random_draw <- rnorm(nrow(data))
          k_quantiles <- quantile(random_draw, 0:k/k)
          folds <- cut(random_draw, k_quantiles, include.lowest = TRUE)
          levels(folds) <- 1:k
          data <- data %>% 
                    mutate(fold = sample(folds, size = length(folds), replace = FALSE))
          names(data)[names(data) == y] <- "y"
          
          # Test the model on each one of the k folds
          folds   <- data.frame()
          factors <- names(model$tables)
          confusion_mat <- NULL
          for(i in 1:k){
                    data_train <- data %>% 
                              filter(fold != i) %>% 
                              dplyr::select(-fold)
                    data_test <- data %>% 
                              filter(fold == i) %>% 
                              dplyr::select(-fold)
                    model_train <- naiveBayes(as.formula(paste("y ~ ", paste(factors, collapse = " + "))), data = data_train)
                    y_test <- data_test %>% dplyr::select(y)
                    class  <- predict(model_train, data_test)
                    confusion_mat  <- rbind(confusion_mat, 
                                            data.frame(y = y_test, class = class))
                    confusion_mat_fold <- table(y_test$y, class)
                    class_accuracy <- prop.table(confusion_mat_fold, margin = 1)
                    folds <- rbind(folds, c(diag(class_accuracy), sum(diag(confusion_mat_fold))/sum(confusion_mat_fold)))
          }
          names(folds) <- c(levels(data$y), "overall_accuracy")
          folds <- data.frame(fold = 1:k, folds)
          cv <- confusion_mat %>% 
                    tabyl(y, class) %>% 
                    adorn_percentages("row") %>%
                    adorn_pct_formatting(digits = 2) %>%
                    adorn_ns() 
          names(cv)[1] <- y
          return(list(folds = folds, cv = cv))
}


