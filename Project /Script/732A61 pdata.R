
url <- "http://stats.nba.com/stats/leagueleaders/?Season=2015-16&SeasonType=Regular%20Season&PerMode=PerGame&LeagueID=00&Scope=S&StatCategory=PTS"
datalist <- jsonlite::fromJSON(url)

leaders  <- as.data.frame(datalist$resultSet$rowSet)
colnames(leaders) <- datalist$resultSet$headers

apply(leaders, MARGIN = 2,FUN = typeof)
lead<- apply(leaders[,5:ncol(leaders)], MARGIN = 2, FUN = function(x) as.numeric(as.character(x)) )
leaders<-cbind(leaders[,1:4],lead)
leaders$PLAYER_ID <- as.character(as.numeric(as.character(leaders$PLAYER_ID)))
rm(datalist,url,lead)
#write.csv2(leaders,"leaders.csv")
