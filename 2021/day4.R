library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day4.csv",header = FALSE) %>%
  mutate(V1 = trimws(V1, which = c("both", "left", "right"), whitespace = "[ \t\r\n]"))

draw <- x[1,] %>% mutate_if(is.character,as.numeric)
boards <- x[-1,]

boards <- separate(boards, V1, c("V1","V2",'V3','V4','V5')) %>%
  mutate_if(is.character,as.numeric)


test_boards <- function() {
  for (j in c(1:(nrow(boards)/5))) {
    test <- boards[(1+((j-1)*5)):(5+((j-1)*5)),]
    for (i in c(1:5)) {
      if (test[i,1] == -1 && test[i,2] == -1 && test[i,3] == -1 && test[i,4] == -1 && test[i,5] == -1) {
        return(test)
      }
      if (test[1,i] == -1 && test[2,i] == -1 && test[3,i] == -1 && test[4,i] == -1 && test[5,i] == -1) {
        return(test)
      }
    }
  }
  return(0)
}
stop <- 0
for (z in c(1:ncol(draw))) {
  drawn <- draw[1,z]
  boards[boards == drawn] <- -1
  if (test_boards() != 0 && stop == 0) {
    winner <- test_boards()
    winner_draw <- drawn
    stop <- 1
  }
}
winner[winner == -1] <- 0
sum(winner[,1:5]) * winner_draw



boards <- x[-1,]

boards <- separate(boards, V1, c("V1","V2",'V3','V4','V5')) %>%
  mutate_if(is.character,as.numeric)

winners <- c(1)
test_boards <- function() {
  for (j in c(1:(nrow(boards)/5))) {
    test <- boards[(1+((j-1)*5)):(5+((j-1)*5)),]
    for (i in c(1:5)) {
      if (test[i,1] == -1 && test[i,2] == -1 && test[i,3] == -1 && test[i,4] == -1 && test[i,5] == -1) {
        winners <- append(winners, j)
      }
      if (test[1,i] == -1 && test[2,i] == -1 && test[3,i] == -1 && test[4,i] == -1 && test[5,i] == -1) {
        winners <- append(winners, j)
      }
    }
    
    new_winners <- c(1)
    for (a in c(1:length(winners))) {
      if (winners[a] %in% new_winners) {
        blank=0
      } else {
        new_winners <- c(new_winners,winners[a])
      }  
      
      
    }
    winners <- new_winners
    if (length(winners) == (nrow(boards)/5)) {
      return(test)
    } 
  }
  return(winners)
}
stop <- 0
for (z in c(1:ncol(draw))) {
  drawn <- draw[1,z]
  boards[boards == drawn] <- -1
  if (stop == 0) {
    winners <- test_boards()
  }
  if (!is.null(nrow(winners)) && stop == 0) {
    winner_draw <- drawn
    stop <- 1
  }
}
winners[winners == -1] <- 0
sum(winners[,1:5]) * winner_draw





