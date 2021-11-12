#Biocomputing Exercise 8
#Loan Duong
#1. Plot the running scores for UW vs MSU basketball
#Load the table
GameData <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
#Define variables for two teams
unique(GameData$team)
scoreUW<-0
UWVector<-c(0)
scoreMSU<-0
MSUVector<-c(0)
time<-c(0,GameData$time)
#loop through rows to tally score, generate score vectors
for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
    scoreUW<-scoreUW+GameData$score[i]
    UWVector<-append(UWVector, scoreUW, after=length(UWVector))
    MSUVector<-append(MSUVector, scoreMSU, after=length(MSUVector))
  }else{
    scoreMSU<-scoreMSU+GameData$score[i]
    UWVector<-append(UWVector, scoreUW, after=length(UWVector))
    MSUVector<-append(MSUVector, scoreMSU, after=length(MSUVector))
  }
}
#plot
plot(time,UWVector,type="l",col="red",xlab = "Time(Min)",ylab = "Score", main = "UW vs MSU")
lines(time,MSUVector,type="l", col="dark green")

#2
