#' Spotify Song Data
#' 
#' A sub-sample of the Spotify song data originally collected by Kaylin Pavlik (kaylinquest) and distributed through the R for Data Science TidyTuesday project. 
#' 
#' @format A data frame with 350 songs (or tracks) and 23 variables:
#' \describe{
#'   \item{track_id}{unique song identifier}
#'   \item{title}{song name}
#'   \item{artist}{song artist}
#'   \item{popularity}{song popularity from 0 (low) to 100 (high)}
#'   \item{album_id}{id of the album on which the song appears}
#'   \item{album_name}{name of the album on which the song appears}
#'   \item{album_release_date}{when the album was released}
#'   \item{playlist_name}{Spotify playlist on which the song appears}
#'   \item{playlist_id}{unique playlist identifier}
#'   \item{genre}{genre of the playlist}
#'   \item{subgenre}{subgenre of the playlist}
#'   \item{danceability}{a score from 0 (not danceable) to 100 (danceable) based on features such as tempo, rhythm, etc.}
#'   \item{energy}{a score from 0 (low energy) to 100 (high energy) based on features such as loudness, timbre, entropy, etc.}
#'   \item{key}{song key}
#'   \item{loudness}{song loudness (dB)}
#'   \item{mode}{0 (minor key) or 1 (major key)}
#'   \item{speechiness}{a score from 0 (non-speechy tracks) to 100 (speechy tracks)}
#'   \item{acousticness}{a score from 0 (not acoustic) to 100 (very acoustic)}
#'   \item{instrumentalness}{a score from 0 (not instrumental) to 100 (very instrumental)}
#'   \item{liveness}{a score from 0 (no live audience presence on the song) to 100 (strong live audience presence on the song)}
#'   \item{valence}{a score from 0 (the song is more negative, sad, angry) to 100 (the song is more positive, happy, euphoric)}
#'   \item{tempo}{song tempo (beats per minute)}
#'   \item{duration_ms}{song duration (ms)}
#'   }
#' @source \url{https://github.com/rfordatascience/tidytuesday/blob/master/data/2020/2020-01-21/spotify_songs.csv/}.
"spotify"
