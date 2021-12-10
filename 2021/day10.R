library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day10.csv",colClasses = 'character',header = FALSE)
len <- nrow(x)
stop <- 0

while (stop == 0) {
  test = nchar(x)
  for (i in c(1:len)) {
    x[i,1] <- gsub("{}", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("[]", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("()", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("<>", "", x[i,1], fixed = TRUE)
  }
  if (nchar(x) == test) {
    stop <- 1
  }
}

stop <- 0

while (stop == 0) {
  test = nchar(x)
  for (i in c(1:len)) {
    x[i,1] <- gsub("{", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("[", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("(", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("<", "", x[i,1], fixed = TRUE)
  }
  if (nchar(x) == test) {
    stop <- 1
  }
}

answer <- 0
for (i in c(1:len)) {
  if (substr(x[i,1],1,1) == ')') {answer <- answer + 3}
  if (substr(x[i,1],1,1) == ']') {answer <- answer + 57}
  if (substr(x[i,1],1,1) == '}') {answer <- answer + 1197}
  if (substr(x[i,1],1,1) == '>') {answer <- answer + 25137}
}

answer






x <- read.csv("GitHub/AdventOfCode/2021/data/day10.csv",colClasses = 'character',header = FALSE)
len <- nrow(x)
stop <- 0

while (stop == 0) {
  test = nchar(x)
  for (i in c(1:len)) {
    x[i,1] <- gsub("{}", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("[]", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("()", "", x[i,1], fixed = TRUE)
    x[i,1] <- gsub("<>", "", x[i,1], fixed = TRUE)
  }
  if (nchar(x) == test) {
    stop <- 1
  }
}

stop <- 0

x <- x %>% 
  filter(!grepl('}', V1)) %>% 
  filter(!grepl(')', V1)) %>% 
  filter(!grepl(']', V1)) %>% 
  filter(!grepl('>', V1)) 
  
answer_set <- vector()
for (k in c(1:nrow(x))) {
  test <- intToUtf8(rev(utf8ToInt(x[k,1])))
  answer <- 0
  for (j in c(1:nchar(test))){
    if (substr(test,j,j) == '(') {answer <- answer*5 + 1}
    if (substr(test,j,j) == '[') {answer <- answer*5 + 2}
    if (substr(test,j,j) == '{') {answer <- answer*5 + 3}
    if (substr(test,j,j) == '<') {answer <- answer*5 + 4}
    }
  answer_set <- append(answer_set,answer)
}
answer_set <- sort(answer_set)

answer_set[(length(answer_set)/2)+1]
