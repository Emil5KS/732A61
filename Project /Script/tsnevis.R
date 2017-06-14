library(tsne)
library(ggplot2)
library(RColorBrewer)
#per5 <- tsne(X, k = 2, initial_dims = 33, perplexity = 5, max_iter = 2000, min_cost = 0.0001)
per7 <- tsne(X, k = 2, initial_dims = 33, perplexity = 7, max_iter = 2000, min_cost = 0.0001)
per12<- tsne(X, k = 2, initial_dims = 33, perplexity = 12, max_iter = 3500, min_cost = 0.0001)
per15<- tsne(X, k = 2, initial_dims = 33, perplexity = 15, max_iter = 3000, min_cost = 0.0001)
per20<- tsne(X, k = 2, initial_dims = 33, perplexity = 20, max_iter = 2000, min_cost = 0.0001)
per30<- tsne(X, k = 2, initial_dims = 33, perplexity = 30, max_iter = 2000, min_cost = 0.0001)
per50<- tsne(X, k = 2, initial_dims = 33, perplexity = 50, max_iter = 2000, min_cost = 0.0001)
per60<- tsne(X, k = 2, initial_dims = 33, perplexity = 60, max_iter = 2000, min_cost = 0.0001)


init_per5  <- tsne(X,initial_config = per5, k = 2, initial_dims = 16, perplexity = 5, max_iter = 2000, min_cost = 0.0001)
init_per15  <- tsne(X,initial_config = per15, k = 2, initial_dims = 16, perplexity = 15, max_iter = 2000, min_cost = 0.0001)
init_per20  <- tsne(X,initial_config = per20, k = 2, initial_dims = 16, perplexity = 20, max_iter = 2000, min_cost = 0.0001)

iter_init_per5  <- tsne(X,initial_config = per5, k = 2, initial_dims = 16, perplexity = 5, max_iter = 20000, min_cost = 0.0001)



per5_2 <- tsne(X, k = 2, initial_dims = 33, perplexity = 5, max_iter = 2000, min_cost = 0.0001)
per5_3 <- tsne(X, k = 2, initial_dims = 33, perplexity = 5, max_iter = 2000, min_cost = 0.0001)
per5_4 <- tsne(X, k = 2, initial_dims = 33, perplexity = 5, max_iter = 2000, min_cost = 0.0001)


p5 <- ggplot(data = fullset) + geom_point(aes(x = per10[,1], y = per10[,2])) + 
  theme_bw()  + 
  labs(
       title = "t-SNE visualization", 
       x = "", 
       y = "",
       caption = "Perplexity 10"
       ) +
  theme(
        plot.title = element_text(hjust = 0.5), 
        panel.grid.major = element_blank(),
        axis.title=element_blank(),
        #axis.text=element_blank(),
        axis.ticks=element_blank()
        ) 

plot(p5)

p5 + coord_cartesian(ylim=c(0, -51),xlim = c(28,70))+  geom_text(aes(x = per10[,1], y = per10[,2], label = PLAYER), 
                        color = "black", nudge_y = 2,nudge_x = 1.2, check_overlap = FALSE ) 
p5 +geom_text(aes(x = per10[,1], y = per10[,2], label = PLAYER), 
            color = "black", nudge_y = 1.5,nudge_x = 1.2, check_overlap = FALSE ) 


Cluster <-factor(k10$class)

ggplot(data = fullset) + geom_point(aes(x = per10[,1], y = per10[,2], col = Cluster )) + 
  theme_bw()  + 
  labs(
    title = "t-SNE visualization", 
    x = "", 
    y = "",
    caption = "Perplexity 10"
  ) +
  theme(
    plot.title = element_text(hjust = 0.5), 
    panel.grid.major = element_blank(),
    axis.title=element_blank(),
    #axis.text=element_blank(),
    axis.ticks=element_blank()
  ) +
  scale_color_brewer(palette="Paired")





kmeansPER5 <- kmeans(per5,7)

plot(per5, asp = c(1,1),col = k10$class)
text(per5, labels=fullset$PLAYER, cex= 0.7, pos=3)
plot(per7,asp = c(1,1))
text(per7, labels=fullset$PLAYER, cex = 0.7, pos=3)
plot(per10,asp = c(1,1))
text(per10, labels=fullset$PLAYER, cex= 0.7, pos=3)
plot(per20,asp = c(1,1))
text(per20, labels=fullset$PLAYER, cex= 0.7, pos=3)
plot(per30,asp = c(1,1))
text(per30, labels=fullset$PLAYER, cex= 0.7, pos=3)
plot(per50,asp = c(1,1))
text(per50, labels=fullset$PLAYER, cex= 0.7, pos=3)
plot(per60,asp = c(1,1))
text(per60, labels=fullset$PLAYER, cex= 0.7, pos=3)




plot(per15,asp = c(1,1))
text(per15, labels=fullset$PLAYER, cex= 0.7, pos=3)

plot(init_per15,asp = c(1,1))
text(init_per15, labels=fullset$PLAYER, cex= 0.7, pos=3)



plot(init_per5,asp = c(1,1))
text(init_per5, labels=fullset$PLAYER, cex= 0.7, pos=3)

plot(iter_init_per5)
text(iter_init_per5, labels=fullset$PLAYER, cex= 0.7, pos=3)

plot(init_per20,asp = c(1,1))
text(init_per20, labels=fullset$PLAYER, cex= 0.7, pos=3)
