#' Hotel Bookings Data
#' 
#' A random subset of the data on hotel bookings originally collected by Antonio, Almeida and Nunes (2019) and distributed through the R for Data Science TidyTuesday project. 
#' 
#' @format A data frame with 1000 hotel bookings and 32 variables on each booking. 
#' \describe{
#'   \item{hotel}{"Resort Hotel" or "City Hotel"}
#'   \item{is_canceled}{whether the booking was cancelled}
#'   \item{lead_time}{number of days between booking and arrival}
#'   \item{arrival_date_year}{year of scheduled arrival}
#'   \item{arrival_date_month}{month of scheduled arrival}
#'   \item{arrival_date_week_number}{week of scheduled arrival}
#'   \item{arrival_date_day_of_month}{day of month of scheduled arrival}
#'   \item{stays_in_weekend_nights}{number of reserved weekend nights}
#'   \item{stays_in_week_nights}{number of reserved week nights}
#'   \item{adults}{number of adults in booking}
#'   \item{children}{number of children}
#'   \item{babies}{number of babies}
#'   \item{meal}{whether the booking includes breakfast (BB = bed & breakfast), breakfast and dinner (HB = half board), or breakfast, lunch, and dinner (FB = full board)}
#'   \item{country}{guest's country of origin}
#'   \item{market_segment}{market segment designation (eg: TA = travel agent, TO = tour operator)}
#'   \item{distribution_channel}{booking distribution channel (eg: TA = travel agent, TO = tour operator)}
#'   \item{is_repeated_guest}{whether or not booking was made by a repeated guest}
#'   \item{previous_cancellations}{guest's number of previous booking cancellations}
#'   \item{previous_bookings_not_canceled}{guest's number of previous bookings that weren't cancelled}
#'   \item{reserved_room_type}{code for type of room reserved by guest}
#'   \item{assigned_room_type}{code for type of room assigned by hotel}
#'   \item{booking_changes}{number of changes made to the booking}
#'   \item{deposit_type}{No Deposit, Non Refund, Refundable}
#'   \item{agent}{booking travel agency}
#'   \item{company}{booking company}
#'   \item{days_in_waiting_list}{number of days the guest waited for booking confirmation}
#'   \item{customer_type}{Contract, Group, Transient, Transient-party (a transient booking tied to another transient booking)}
#'   \item{average_daily_rate}{average hotel cost per day}
#'   \item{required_car_parking_spaces}{number of parking spaces the guest needed}
#'   \item{total_of_special_requests}{number of guest special requests}
#'   \item{reservation_status}{Canceled, Check-Out, No-Show}
#'   \item{reservation_status_date}{when the guest cancelled or checked out}
#'   }
#' @source 
#' Nuno Antonio, Ana de Almeida, and Luis Nunes (2019). "Hotel booking demand datasets." Data in Brief (22): 41-49.
#' \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-02-11/hotels.csv/}.
"hotel_bookings"
