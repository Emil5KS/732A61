VarExplain<- c("Identification for player","Over all rank",
               "Player name","Playing for team",
               "Games Playes","Minutes played",
               "Field Goals Made","Field Goals Attempted",
               "Field Goal Percentage", "3-Point Field Goals Made",
               "3-Point Field Goals Attempted",
               "3-Point Field Goal Percentage",
               "Free Throws Made", "Free Throws Attempted", 
               "Free Throw Percentage","Offensive rebound",
               "Defensive Rebound","Rebound","Assist","Steals",
               "Blocks","Turnovers","Points Made",
               "Efficency","Wins","Losses",
               "Distance in feet", "Distance in Miles",
               "Distance Off Ball","Distance Miles Defended",
               "Average Speed", "Average Speed Off Ball",
               "Average Speed On Defence")


abbrivations <- colnames(fullset)
#wantedvar<- c(6,8:9,11:12,14:17,19:23,27,29:33)
wantedvar<- c(6,8:9,11:12,14:17,19:23,27,31)


length(VarExplain)
print(xtable(cbind(abbrivations,VarExplain)[,],
       caption = "All variables collected"),include.rownames = FALSE)


xtable(totalk,
       caption = "EM algorithm 10 cluster result: non-shooting stats")

xtable(shooting,
       caption = "EM algorithm 10 cluster result: shooting stats")

xtable(other,
       caption = "EM algorithm 10 cluster result: non-shooting stats")

print(xtable(typicalplayers,
       caption = "Cluster lables and typical members"),include.rownames = FALSE)



cbind(k10$class,)
a1 <- c(as.character(idplay$x$`01`))
a2 <- c(as.character(idplay$x$`02`))
a3 <- c(as.character(idplay$x$`03`))
a4 <- c(as.character(idplay$x$`04`))
a5 <- c(as.character(idplay$x$`05`))
a6 <- c(as.character(idplay$x$`06`))
a7 <- c(as.character(idplay$x$`07`))
a8 <- c(as.character(idplay$x$`08`))
a9 <- c(as.character(idplay$x$`09`))
a10 <- c(as.character(idplay$x$`10`))

a <- matrix(NA,nrow = 10, ncol = 41)

a[1,] <- c(as.character(idplay$x$`01`),rep(NA, (41 - length(a1))) )
a[2,] <- c(as.character(idplay$x$`02`),rep(NA, (41 - length(a2))) )
a[3,] <- c(as.character(idplay$x$`03`),rep(NA, (41 - length(a3))) )
a[4,] <- c(as.character(idplay$x$`04`),rep(NA, (41 - length(a4))) )
a[5,] <- c(as.character(idplay$x$`05`),rep(NA, (41 - length(a5))) )
a[6,] <- c(as.character(idplay$x$`06`),rep(NA, (41 - length(a6))) )
a[7,] <- c(as.character(idplay$x$`07`),rep(NA, (41 - length(a7))) )
a[8,] <- c(as.character(idplay$x$`08`),rep(NA, (41 - length(a8))) )
a[9,] <- c(as.character(idplay$x$`09`),rep(NA, (41 - length(a9))) )
a[10,] <- c(as.character(idplay$x$`10`),rep(NA, (41 - length(a10))) )


a <- cbind(paste("Cluster",(1:10)),a)
t(a)
print(xtable(t(a[1:4,-2])),include.rownames = FALSE,include.colnames = FALSE)

print(xtable(t(a[5:10,-2])),include.rownames = FALSE,include.colnames = FALSE)
