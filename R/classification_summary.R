#' Posterior Classification Summaries
#'
#' Given a set of observed data including a binary response variable y 
#' and an rstanreg model of y, 
#' this function returns summaries of the model's posterior classification quality.
#' These summaries include a confusion matrix as well as estimates of the model's
#' sensitivity, specificity, and overall accuracy.
#' 
#' @param model an rstanreg model object with binary y
#' @param data data frame including the variables in the model, both response y and predictors x
#' @param cutoff probability cutoff to classify a new case as positive (0.5 is the default)
#'
#' @return
#' @export
#' @import janitor
#' @import dplyr
#'
#' @examples

classification_summary <- function(model, data, cutoff = 0.5){
          # This function summarizes the classifications across all cases
          if(!("stanreg" %in% class(model))){ stop("the model must be a stanreg object.")}
          
          # Calculate probability posterior predictions
          predictions <- posterior_predict(
                    model, 
                    newdata = data)
          
          # Turn the predictions into classifications
          if("lmerMod" %in% class(model)){
                    y <- model$y
          }
          else {
                    y <- as.data.frame(data %>% dplyr::select(model$terms[[2]]))[,1]
          }
          classifications <- data %>% 
                    mutate(proportion = colMeans(predictions)) %>% 
                    mutate(classification = as.numeric(proportion >= cutoff)) %>% 
                    dplyr::select(proportion, classification) %>% 
                    mutate(y = y)
          
          # Confusion matrix
          confusion_matrix <- classifications %>% 
                    tabyl(y, classification)
          
          # Accuracy rates
          mat <- table(classifications$y, classifications$classification)
          sensitivity <- mat[2,2] / sum(mat[2,])
          specificity <- mat[1,1] / sum(mat[1,])
          overall_accuracy <- sum(diag(mat)) / sum(mat)
          accuracy_rates <- data.frame(c(sensitivity, specificity, overall_accuracy))
          row.names(accuracy_rates) <- c("sensitivity", "specificity", "overall_accuracy")
          names(accuracy_rates) <- ""
          
          return(list(confusion_matrix = confusion_matrix, accuracy_rates = accuracy_rates))
}


