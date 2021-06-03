#' Posterior Classification Summaries for a Naive Bayes model
#'
#' Given a set of observed data including a categorical response variable y 
#' and a naiveBayes model of y, 
#' this function returns summaries of the model's posterior classification quality.
#' These summaries include a confusion matrix as well as an estimate of the model's
#' overall accuracy.
#' 
#' @param model a naiveBayes model object with categorical y
#' @param data data frame including the variables in the model
#' @param y a character string indicating the y variable in data
#'
#' @return a list
#' @export
#' @importFrom stats predict
#' @examples
#' data(penguins_bayes, package = "bayesrules")
#' example_model <- e1071::naiveBayes(species ~ bill_length_mm, data = penguins_bayes)
#' naive_classification_summary(model = example_model, data = penguins_bayes, y = "species")
naive_classification_summary <- function(model, data, y){
          # This function summarizes the classifications across all cases
          if(!("naiveBayes" %in% class(model))){ stop("the model must be a naiveBayes object.")}
          
          # Calculate posterior classifications
          # Turn the predictions into classifications
          classifications <- data %>% 
                    mutate(classification = predict(model, newdata = .)) %>% 
                    dplyr::select(y, classification)
          names(classifications)[1] <- "y"
          
          # Confusion matrix
          confusion_matrix <- classifications %>% 
                    tabyl(y, classification) %>% 
                    adorn_percentages("row") %>%
                    adorn_pct_formatting(digits = 2) %>%
                    adorn_ns() 
          names(confusion_matrix)[1] <- y
          mat <- table(classifications$y, classifications$classification)
          overall_accuracy <- sum(diag(mat)) / sum(mat)
          
          return(list(confusion_matrix = confusion_matrix, overall_accuracy = overall_accuracy))
}


