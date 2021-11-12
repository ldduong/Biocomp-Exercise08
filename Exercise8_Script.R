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

#2. Guess my number game. 
# Computer generates a random number between 1 and 100. 
RandomNumber<-sample(1:100,1)
#Guessing game
GuessingGame<-function(){
  PlayerGuess<-readline(prompt="I'm thinking of a number between 1 and 100. Take a guess? " )
  RemainingGuesses <- 9
  while(RemainingGuesses>0){  
    if(PlayerGuess<RandomNumber){
      cat(paste("Sorry, that's incorrect. Guesses left: ", RemainingGuesses))
      PlayerGuess<-readline(prompt="Try a higher number! ")
      RemainingGuesses<-RemainingGuesses-1
    }else{
      if(PlayerGuess>RandomNumber){
        cat(paste("Sorry, that's incorrect. Guesses left: ", RemainingGuesses))
        PlayerGuess<-readline(prompt="Try a lower number! ")
        RemainingGuesses<-RemainingGuesses-1
      }else{
        cat("Congratulations, you've guessed correctly!")
        if(PlayerGuess==RandomNumber){
          break
        }
      }
    }
  }
}
