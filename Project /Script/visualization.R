library(dplyr)

speed<- read.csv2("/Users/EmilsHem/Documents/732A61/732A61/Project /CleanSpeed.csv", stringsAsFactors = FALSE, dec = ",")
leaders <- read.csv2("/Users/EmilsHem/Documents/732A61/732A61/Project /leaders.csv")
fullset<- left_join(leaders,speed,by = c("PLAYER_ID" = "ID" ))
fullset <- fullset[,-c(1,26)]
fullset <- fullset[,-c(25:27,30)]
colnames(fullset)[5:6] <- c("GP","MIN")

unfactor <- function(x){is.numeric(is.character(x))}
fullset <- apply(fullset[,-c(1,3,4)],2,unfactor) 

rm(leaders,speed)

library(ggplot2)
library(GGally)
library(RColorBrewer)
library(car)
library(animation)

set <- fullset %>% filter(GP > 35)
mycomb <- combn(5:ncol(set),m = 2)

saveVideo({
for ( i in 1:ncol(mycomb)){ 
plot(x = set[,mycomb[1,i]], y = set[,mycomb[2,i]], 
     xlab = colnames(set)[mycomb[1,i]], 
     ylab = colnames(set)[mycomb[2,i]],
     main = paste(colnames(set)[mycomb[2,i]],"vs",colnames(set)[mycomb[1,i]])
     )
}
},
video.name = "ClusterNBAdata.mp4", nmax = 50)


pairs(set[,20:25])
spm(set[,15:20])


ggscatmat(fullset) +
  geom_smooth(method="loess",se=FALSE) +
  theme_bw() +
  ggtitle("Scatterplot matrix") +
  xlab("") +
  ylab("")

