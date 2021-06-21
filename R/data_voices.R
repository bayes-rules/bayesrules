#' Voice Pitch Data
#' 
#' Voice pitch data collected by Winter and Grawunder (2012). 
#' In an experiment, subjects participated in role-playing dialog under various conditions,
#' while researchers monitored voice pitch (Hz).
#' The conditions spanned different scenarios (eg: making an appointment, asking for a favor)
#' and different attitudes to use in the scenario (polite or informal).
#' 
#' @format A data frame with 84 rows and 4 variables. Each row represents a single observation for the given subject.
#' \describe{
#'   \item{subject}{subject identifier}
#'   \item{scenario}{context of the dialog (encoded as A, B, ..., G)}
#'   \item{attitude}{whether the attitude to use in dialog was polite or informal}
#'   \item{pitch}{average voice pitch (Hz)}
#'   }
#' @source Winter, B., & Grawunder, S. (2012). The Phonetic Profile of Korean Formal and Informal Speech Registers. Journal of Phonetics, 40, 808-815. 
#' \url{https://bodo-winter.net/data_and_scripts/POP.csv}.
#' \url{https://bodo-winter.net/tutorial/bw_LME_tutorial2.pdf}.
"voices"
