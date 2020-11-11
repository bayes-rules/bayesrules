spotify_songs <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2020/2020-01-21/spotify_songs.csv')


# Set conditions for sampling
minpop   <- 5   # only use artists whose min popularity is 5+ (after removing 0s)
mincount <- 3   # only use artists have at least 3 songs ranked above 5

# Calculate mean trends in the full data set
subj <- spotify_songs %>% 
          select(track_artist, track_popularity) %>% 
          na.omit() %>% 
          group_by(track_artist) %>% 
          summarize(count = sum(track_popularity > minpop), mins = min(track_popularity,na.rm=TRUE)) %>% 
          filter(count >= mincount, mins >= minpop)
gen <- spotify_songs %>% 
          filter(track_popularity >= minpop) %>% 
          filter(track_artist %in% subj$track_artist) %>% 
          group_by(track_artist) %>% 
          summarize(means = mean(track_popularity, na.rm = TRUE)) %>% 
          summarize(mean0 = mean(means), sd0 = sd(means)) 
gen


# Sample 40 values from that mean dist
set.seed(2)
group_means <- round(rnorm(40, mean = gen$mean0, sd = gen$sd0))
hist(group_means)

# Calculate subject means for eligible artists
subj_means <- spotify_songs %>% 
          filter(track_popularity >= minpop) %>% 
          filter(track_artist %in% subj$track_artist) %>% 
          select(track_artist, track_popularity) %>% 
          na.omit() %>% 
          group_by(track_artist) %>% 
          summarize(means = round(mean(track_popularity, na.rm = TRUE)), 
                    sds = sd(track_popularity, na.rm = TRUE), 
                    count = n()) %>%
          filter(count >= mincount)

# Sample 40 of these subjects who represent the observed range
pick <- rep(NA,40)
set.seed(84735)
for(i in 1:40){
          if(sum(subj_means$means == group_means[i]) > 0){
                    pick[i] <- (subj_means %>% 
                                          filter(means == group_means[i]) %>% 
                                          sample_n(1))$track_artist
          }
}
pick <- na.omit(pick)

# Get a subset with these artists
# Add and remove some artists (either because of their name recognition or because they help illustrate a point)
spotify <- spotify_songs %>% 
          filter(track_popularity >= minpop) %>% 
          filter(track_artist %in% c(pick,"Beyoncé", "Sean Kingston", "Kendrick Lamar", "The Blaze", "Frank Ocean", "J. Cole", "Michael Kiwanuka")) %>%
          filter(!track_artist %in% c("YUNGBLUD","Bryson Tiller","Lil Tjay")) %>% 
          arrange(track_artist)

spotify$track_name[spotify$track_name == "All The Lies - Toby Romeo Remix / Radio Edit"] <- "All The Lies"

usethis::use_data(spotify, overwrite = TRUE)
