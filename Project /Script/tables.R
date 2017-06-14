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
