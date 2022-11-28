library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day11_example.csv",colClasses = 'character',header = FALSE) %>% 
  separate(V1, as.character(c(1:10)),sep=c(1:9)) %>%
  mutate_if(is.character,as.numeric)

dl <- list()
dl[[1]] <- c(1,0)
dl[[2]] <- c(1,1)
dl[[3]] <- c(1,-1)
dl[[4]] <- c(0,1)
dl[[5]] <- c(0,-1)
dl[[6]] <- c(-1,0)
dl[[7]] <- c(-1,1)
dl[[8]] <- c(-1,-1)


x <- x+1
x_copy <- x
for (test_row in c(1:10)) {
  for (test_col in c(1:10)) {
    if (x[test_row,test_col] >= 9) {
      x_copy[test_row,test_col] <- 0
      for (z in c(1:8)) {
        d <- dl[[z]]
        cc <- test_col + d[1]
        rr <- test_row + d[2]
        if (cc > 10 | rr > 10 | cc < 1 | rr < 1) {next}
        if (x[rr,cc] == 9) {next}
        x_copy[rr,cc] <- x[rr,cc]+1
      }
    }
  }
}
x <- x_copy
