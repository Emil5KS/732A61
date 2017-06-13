library(dplyr)

speed<- read.csv2("CleanSpeed.csv")
leaders <- read.csv2("leaders.csv")
fullset<- left_join(leaders,speed,by = c("PLAYER_ID" = "ID" ))
fullset <- fullset[,-c(1,26)]
fullset <- fullset[,-c(25:27,30)]
colnames(fullset)[5:6] <- c("GP","MIN")


boston <- fullset %>% filter(TEAM == "BOS")

library(ggplot2)
ggplot(data = boston,aes( x = DistMiles*1.609344 , y = PTS)) + geom_point( color = "darkgreen" ) +
  geom_label(aes(label = PLAYER), color = "darkgreen", nudge_y = 0.95, check_overlap = FALSE ) +
  labs(title = " PPG vs  km per game coverd during 2015-2016 season", y = "PPG", x = "km")
boston$DistMiles


ggplot(data = boston,aes( x = ((boston$DistMiles*1.609344) / boston$MIN.x), y = boston$PTS)) + geom_point( color = "darkgreen" ) +
  geom_label(aes(label = PLAYER), color = "darkgreen", nudge_y = 0.95, check_overlap = FALSE ) +
  labs(title = " PPG vs  km per game coverd during 2015-2016 season", y = "PPG", x = "kilometers / Minutes played")
boston$DistMiles