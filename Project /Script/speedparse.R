
setwd("/Users/EmilsHem/Documents/732A61/732A61/Project ") #spacet ska va dar
midat<-readLines(file("speed.txt"))
speed<-as.data.frame(as.character(midat))
colnames(speed) <- "placeholder"

newdat<-data.frame(x=speed$placeholder[!grepl(x = speed$placeholder, pattern = "\\<\\/tr\\>.+",perl = TRUE)])

vecvec <- c()
for (i in 1:nrow(newdat)){
new2<-str_replace(newdat[i,1], pattern = '.\\<td.+player\\/\\#\\!\\/',replacement = "")
#print(new2)
vecvec[i]<- str_replace(new2, pattern = '\\/\\?Season\\=2015\\-16\\&amp\\;SeasonType\\=Regular Season',replacement = " ")
}
mydat <- data.frame(x=vecvec)

vecvec <-c()
for (i in 1:nrow(mydat)){
a<-str_replace(mydat[i,1],pattern = '\\<td class\\="ng-binding\\"\\>',replace = "")
vecvec[i]<-str_replace(a,pattern = '\\<\\/td\\>',replace = "")
}
mydat <- data.frame(x=vecvec[2:length(vecvec)])


test<-as.data.frame(matrix(vecvec[2:length(vecvec)], ncol = 13, byrow = TRUE))
dim(test)
stri<-"Player 	Team 	GP 	W 	L 	MIN 	Dist. Feet 	DistMiles 	DistMilesOff 	DistMilesDef 	AvgSpeed 	AvgSpeedOff 	AvgSpeedDef"

colnames(test)<- c(str_split(stri,pattern = " 	",simplify = TRUE))


test$ID <- str_split(test$Player,pattern = '\\"',simplify = TRUE)[,1]

bb<-substr(str_split(test$Player,pattern = '\\"',simplify = TRUE)[,2], start =2, stop = 200)
test$Player<- substr(bb,start = 1, stop = str_length(bb)-4)

test$Team<- substr(test$Team,start = str_length(test$Team)-6, stop=str_length(test$Team)-4 )

finalset <- test[1:473,c(14,1,2:13)]
colnames(finalset)[1] <- "PLAYER_ID"
speedy<-apply(finalset[4:14],MARGIN = 2, FUN = function(x) as.numeric(as.character(x)) )
speed<-data.frame(cbind(finalset[,1:3],speedy))

speed$PLAYER_ID <- str_trim(speed$PLAYER_ID)

rm(mydat,finalset,speedy,new2,newdat,test,a,bb,i,midat,new,stri,vecvec)

#write.csv2(finalset,"CleanSpeed.csv")
