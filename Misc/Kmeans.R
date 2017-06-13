
emilKmeans <- function(exdata, eps){ 

  
myK <- sample(1:nrow(exdata),2)

exdata$k <- as.character(rep(0,times = nrow(exdata)))
exdata$k[myK] <- as.character(c(1:length(myK)))

meansK <- apply(as.matrix(subset(exdata, exdata$k %in% c(1,2) ),byrow= FALSE), MARGIN = 2, FUN = as.numeric)

euclid <- function(x,xo){
  rowDiffs<-sweep(x,MARGIN = 2, STATS = xo, FUN = "-")^2 #sweep beräknar rad-differenser 
  sqrt(apply(rowDiffs, MARGIN = 1, FUN = sum)) #Sedan plussar vi ihop och drar roten ur
}



k1 <- euclid(as.matrix(exdata[,1:2]), meansK[meansK[,3] == 1,1:2]) 
k2 <- euclid(as.matrix(exdata[,1:2]), meansK[meansK[,3] == 2,1:2])

exdata$k <- ifelse(k1 > k2, 2,1) # Om avståndet i k1 är större än k2 är det k2 den tillhör

p1<-ggplot(exdata,aes(x= x1, y= x2, col = k)) + geom_point()
plot(p1,newpage = TRUE)


prevSSE <- 0 # init
SSE <- 1     # init
while( SSE - prevSSE > eps){
      prevSSE <- SSE
    
      meansK<- as.matrix(aggregate(x = exdata, by =list(exdata$k), FUN = mean)[,2:4])
      
      k1 <- euclid(as.matrix(exdata[,1:2]), meansK[meansK[,3] == 1,1:2]) 
      k2 <- euclid(as.matrix(exdata[,1:2]), meansK[meansK[,3] == 2,1:2])
      
      exdata$k <- ifelse(k1 > k2, 2,1)
      
      p2<-ggplot(exdata,aes(x= x1, y= x2, col = k)) + geom_point()
      plot(p2,newpage = TRUE)
      
      
      SSE<- sum(euclid(as.matrix(exdata[exdata$k == 1,1:2]), meansK[meansK[,3] == 1,1:2])^2) +
        sum(euclid(as.matrix(exdata[exdata$k == 2,1:2]), meansK[meansK[,3] == 2,1:2])^2)
      Sys.sleep(2)
} 
return(list(meansK,SSE))
}

exiris <- data.frame(x1=iris$Petal.Length,x2=iris$Petal.Width)
exirisSCALE <- as.data.frame(scale(data.frame(x1=iris$Petal.Length,x2=iris$Petal.Width)))

# set.seed(100) bra ex varför man ska skala data
set.seed(100)
emilKmeans(exdata = exirisSCALE, eps = 0.001)
