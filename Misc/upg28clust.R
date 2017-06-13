# 2.8 

#a)
a <- matrix(c(1.5, 1.7, 2, 1.9, 1.6, 1.8, 1.2, 1.5, 1.5, 1.0), ncol = 2, byrow = TRUE)
round(dist(a),digits = 2)

b <- rbind(a,c(1.4,1.6)) 
b

round(dist(b),digits = 2)

#b) 

As<-scale(a)

round(dist(As),digits = 2)

Bs<-scale(b)

round(dist(Bs),digits = 2)


