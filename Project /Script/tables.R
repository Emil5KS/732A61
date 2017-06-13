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
xtable(cbind(abbrivations,VarExplain)[wantedvar,],
       caption = "Variables used in clustering and visualization")
