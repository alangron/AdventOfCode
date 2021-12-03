library(tidyverse)
library(stringr)
x <- read.csv("GitHub/AdventOfCode/2021/data/day3.csv",header = FALSE,colClasses = 'character') %>%
  separate(V1, c("V1","V2",'V3','V4','V5','V6','V7','V8','V9','V10','V11','V12'),sep=c(1:11)) %>%
  mutate_if(is.character,as.numeric)
len <- nrow(x)
width <- ncol(x)

gamma = ''
epsilon = ''

for (i in c(1:width)) {
  if (sum(x[i]) > len/2) {
    gamma = paste(gamma,'1',sep='')
    epsilon = paste(epsilon,'0',sep='')
  } else {
    gamma = paste(gamma,'0',sep='')
    epsilon = paste(epsilon,'1',sep='')
  }
}

strtoi(gamma, base = 2) * strtoi(epsilon, base = 2)

oxy <- x
co2 <- x

for (i in c(1:width)) {
  oxy_len <- nrow(oxy)
  co2_len <- nrow(co2)
  if (sum(oxy[i]) >= oxy_len/2) {
    oxy = oxy[oxy[i]==1,]
  } else {
    oxy = oxy[oxy[i]==0,]
  }
  
  if (sum(co2[i]) >= co2_len/2) {
    co2 = co2[co2[i]==0,]
  } else {
    co2 = co2[co2[i]==1,]
  }
  
  if (nrow(oxy) == 1) {
    gamma = apply(oxy, 1, paste, collapse="")
  }
  if (nrow(co2) == 1) {
    epsilon = apply(co2, 1, paste, collapse="")
  }
  
}
strtoi(gamma, base = 2) * strtoi(epsilon, base = 2)

x <- read.csv("GitHub/AdventOfCode/2021/data/day3_example.csv",header = FALSE,colClasses = 'character') %>%
  separate(V1, c("V1","V2",'V3','V4','V5'),sep=c(1:4)) %>%
mutate_if(is.character,as.numeric)

test <- -1

x[order(x[,1], test*x[,2], x[,3] , x[,4] , x[,5]), ]


