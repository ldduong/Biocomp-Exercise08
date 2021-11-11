#

#1. Game plot
#Load the table
GameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
#Define variables for two teams
unique(GameData$team)
scoreUW<-0
scoreMSU<-0
#loop through rows to tally score
for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
    scoreUW<-scoreUW+GameData$score[i]
  }else{
    scoreMSU<-scoreMSU+GameData$score[i]
  }
}
