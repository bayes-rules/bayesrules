#' Spotify Song Data
#' 
#' A sub-sample of the Spotify song data originally collected by Kaylin Pavlik (kaylinquest) and distributed through the R for Data Science TidyTuesday project. 
#' 
#' @format A data frame with 350 songs (or tracks) and 23 variables:
#' \describe{
#'   \item{track_id}{unique song identifier}
#'   \item{track_name}{song name}
#'   \item{track_artist}{song artist}
#'   \item{track_popularity}{song popularity from 0 (low) to 100 (high)}
#'   \item{track_album_id}{album on which the song appears}
#'   \item{track_album_release_date}{when the album was released}
#'   \item{playlist_name}{Spotify playlist on which the song appears}
#'   \item{playlist_id}{unique playlist identifier}
#'   \item{playlist_genre}{genre of the playlist}
#'   \item{playlist_subgenre}{subgenre of the playlist}
#'   \item{danceability}{a score from 0 (not danceable) to 1 (danceable) based on features such as tempo, rhythm, etc.}
#'   \item{energy}{a score from 0 (low energy) to 1 (high energy) based on features such as loudness, timbre, entropy, etc.}
#'   \item{key}{song key}
#'   \item{loudness}{song loudness (dB)}
#'   \item{mode}{0 (minor key) or 1 (major key)}
#'   \item{speechiness}{a score from 0 (non-speechy tracks) to 1 (speechy tracks)}
#'   \item{acousticness}{a score from 0 (not acoustic) to 1 (very acoustic)}
#'   \item{instrumentalness}{a score from 0 (not instrumental) to 1 (very instrumental)}
#'   \item{liveness}{a score from 0 (no live audience presence on the song) to 1 (strong live audience presence on the song)}
#'   \item{valence}{a score from 0 (the song is more negative, sad, angry) to 1 (the song is more positive, happy, euphoric)}
#'   \item{tempo}{song tempo (beats per minute)}
#'   \item{duration_ms}{song duration (ms)}
#'   }
#' @source \url{https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv}.
"spotify"
