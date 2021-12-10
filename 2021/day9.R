library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day9.csv",colClasses = 'character',header = FALSE) %>% 
  separate(V1, as.character(c(1:100)),sep=c(1:99)) %>%
  mutate_if(is.character,as.numeric)
len <- nrow(x)
width <- ncol(x)
answer <- x
for (j in c(1:len)) {
  for (i in c(1:width)) {
    if (i < width) {
      if (x[j,i] >= x[j,i+1]) {
        answer[j,i] <- -1
      }
      if (x[j,i] <= x[j,i+1]) {
        answer[j,i+1] <- -1
      }
    }
    if (j < len) {
      if (x[j,i] >= x[j+1,i]) {
        answer[j,i] <- -1
      }
      if (x[j,i] <= x[j+1,i]) {
        answer[j+1,i] <- -1
      }
    }
  }
}

sum(answer+1)
