library(dplyr)
library(mixtools)
library(EMCluster)
library(tsne)
library(xtable)

unfactor<- function(x){
  x <- as.numeric(as.character(x))
}

speed<- read.csv2("data/CleanSpeed.csv")
leaders <- read.csv2("data/leaders.csv")
fullset<- left_join(leaders,speed,by = c("PLAYER_ID" = "ID" ))
fullset <- fullset[,-c(1,26)]
fullset <- fullset[,-c(25:27,30)]
colnames(fullset)[5:6] <- c("GP","MIN")


fullset[,-c(1:4)] <- apply(fullset[,-c(1:4)], MARGIN = 2, unfactor)

hasna <- apply(fullset, MARGIN = 1, function(x) sum(is.na(x)) != 0)


leaders[leaders$PLAYER_ID %in% fullset[hasna,1],]
speed[speed$ID %in% fullset[hasna,1],]
wantedvar<- c(6,8:9,11:12,14:17,19:23,27,31)
#wantedvar<- c(6,8:9,11:12,14:17,19:23,27,29:33)

X <- fullset[,wantedvar] 
X <- scale(X)
rm(list = ls()[!(ls() %in% c("fullset","X"))])

