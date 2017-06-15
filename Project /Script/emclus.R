
EM10K <- simple.init(X, nclass = 10)
k10 <-   emcluster(X, EM10K, assign.class = TRUE)
summary(k10)
plot(y = fullset$PTS, x = fullset$MIN, col = k10$class)

fullset$PLAYER,k10$class

typicalplayers <- matrix(ncol=5,nrow = 10)

typicalplayers[,2] <- as.character(1:10)
for (i in 1:10){
typicalplayers[i,3:5]  <- as.character(fullset$PLAYER[k10$class == i][1:3])
}
  
  
shooting <- cbind(k10$nc,
                  aggregate(fullset[,wantedvar[2:7]],by = list(k10$class), FUN = mean ))
other <- cbind(k10$nc,
               aggregate(fullset[,wantedvar[-c(2:7)]],by = list(k10$class), FUN = mean))
totalk <- cbind(nc=k10$nc,
                aggregate(fullset[,wantedvar],by = list(k10$class), FUN = mean ))

totalk <- totalk[,c(2,1,3:ncol(totalk))]
other <- other[,c(2,1,3:ncol(other))]
shooting <- shooting[,c(2,1,3:ncol(shooting))]





idplay <- aggregate(fullset$PLAYER, by = list(k10$class), FUN = function(x){x} )







############## Gammalt skräp
x1<- cbind(fullset$OREG,fullset$DREB,fullset$AST)
x1[is.na(x1[,1]),1] 
x1[is.na(x1[,2]),2] <- mean(fullset$DistMiles,na.rm = TRUE)
emobj <- simple.init(x1, nclass = 10)
emobj <- shortemcluster(x1, emobj)
summary(emobj)

ret <- emcluster(x1, emobj, assign.class = TRUE)
summary(ret)
ret$class
str(ret)


plot(x1,col = ret$class)
library(scatterplot3d)
scatterplot3d(x1,color = ret$class, main="3D Scatterplot")

library(rgl)

plot3d(x1, col=ret$class, size=3, expand = 1.5) 

cbind(as.character(fullset$PLAYER),as.character(ret$class))
aggregate(fullset[,5:20], by = list(ret$class), FUN = mean)
r3dDefaults$windowRect
r3dDefaults$windowRect <- c(0,50, 700, 700)
