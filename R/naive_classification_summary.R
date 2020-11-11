#' Posterior Classification Summaries
#'
#' @param model a naiveBayes model object with categorical y
#' @param data data frame including the variables in the model
#' @param y a character string indicating the y variable in data
#'
#' @return
#' @export
#'
#' @examples

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


