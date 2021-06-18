#' Big Word Club (BWC)
#' 
#' Data on the effectiveness of a digital learning program designed by the Abdul Latif Jameel Poverty Action Lab (J-PAL) to address disparities in vocabulary levels among children from households with different income levels.
#' 
#' @format A data frame with 818 student-level observations and 31 variables:
#' \describe{
#'   \item{participant_id}{unique student id}
#'   \item{treat}{control group (0) or treatment group (1)}
#'   \item{age_months}{age in months}
#'   \item{female}{whether student identifies as female}
#'   \item{kindergarten}{grade level, pre-school (0) or kindergarten (1)}
#'   \item{teacher_id}{unique teacher id}
#'   \item{school_id}{unique school id}
#'   \item{private_school}{whether school is private}
#'   \item{title1}{whether school has Title 1 status}
#'   \item{free_reduced_lunch}{percent of school that receive free / reduced lunch}
#'   \item{state}{school location}
#'   \item{esl_observed}{whether student has ESL status}
#'   \item{special_ed_observed}{whether student has special education status}
#'   \item{new_student}{whether student enrolled after program began}
#'   \item{distracted_a1}{student's distraction level during assessment 1 (0 = not distracted; 1 = mildly distracted; 2 = moderately distracted; 3 = extremely distracted)}
#'   \item{distracted_a2}{same as distracted_a1 but during assessment 2}
#'   \item{distracted_ppvt}{same as distracted_a1 but during standardized assessment}
#'   \item{score_a1}{student score on BWC assessment 1}
#'   \item{invalid_a1}{whether student's score on assessment 1 was invalid}
#'   \item{score_a2}{student score on BWC assessment 2}
#'   \item{invalid_a2}{whether student's score on assessment 2 was invalid}
#'   \item{score_ppvt}{student score on standardized assessment}
#'   \item{score_ppvt_age}{score_ppvt adjusted for age}
#'   \item{invalid_ppvt}{whether student's score on standardized assessment was invalid}
#'   \item{t_logins_april}{number of teacher logins onto BWC system in April}
#'   \item{t_logins_total}{number of teacher logins onto BWC system during entire study}
#'   \item{t_weeks_used}{number of weeks of the BWC program that the classroom has completed}
#'   \item{t_words_learned}{teacher response to the number of words students had learned through BWC (0 = almost none; 1 = 1 to 5; 2 = 6 to 10)}
#'   \item{t_financial_struggle}{teacher response to the number of their students that have families that experience financial struggle}
#'   \item{t_misbehavior}{teacher response to frequency that student misbehavior interferes with teaching (0 = never; 1 = rarely; 2 = occasionally; 3 = frequently)}
#'   \item{t_years_experience}{teacher's number of years of teaching experience}
#'   \item{score_pct_change}{percent change in scores before and after the program}
#'   }
#' @source These data correspond to the following study: Ariel Kalil, Susan Mayer, Philip Oreopoulos (2020). Closing the word gap with Big Word Club: Evaluating the Impact of a Tech-Based Early Childhood Vocabulary Program. Data was obtained through the was obtained through the Inter-university Consortium for Political and Social Research (ICPSR) \url{https://www.openicpsr.org/openicpsr/project/117330/version/V1/view/}.
"big_word_club"
