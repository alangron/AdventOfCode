library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day5.csv",header = FALSE) %>%
  rename(x1=V1,y2=V3) %>%
  separate(V2, c('y1','x2')) %>% 
  mutate_if(is.character,as.numeric)

x <- filter(x,x1==x2 | y1==y2)
rows <- nrow(x)

df <- data.frame(x=integer(),
                 y=integer()) 

for (i in c(1:rows)) {
  if (x$x1[i] == x$x2[i]) {
    for (j in c(x$y1[i]:x$y2[i])) {
      de<-data.frame(x$x1[i],j)
      names(de)<-c('x','y')
      df <- rbind(df, de)
    }
  }
  if (x$y1[i] == x$y2[i]) {
    for (j in c(x$x1[i]:x$x2[i])) {
      de<-data.frame(j,x$y1[i])
      names(de)<-c('x','y')
      df <- rbind(df, de)
    }
  }
}

df <- df %>% count(x,y)

nrow(filter(df,n>1))








x <- read.csv("GitHub/AdventOfCode/2021/data/day5.csv",header = FALSE) %>%
  rename(x1=V1,y2=V3) %>%
  separate(V2, c('y1','x2')) %>% 
  mutate_if(is.character,as.numeric)

rows <- nrow(x)

df <- data.frame(x=integer(),
                 y=integer()) 

for (i in c(1:rows)) {
  if (x$x1[i] == x$x2[i]) {
    for (j in c(x$y1[i]:x$y2[i])) {
      de<-data.frame(x$x1[i],j)
      names(de)<-c('x','y')
      df <- rbind(df, de)
    }
  }
  else if (x$y1[i] == x$y2[i]) {
    for (j in c(x$x1[i]:x$x2[i])) {
      de<-data.frame(j,x$y1[i])
      names(de)<-c('x','y')
      df <- rbind(df, de)
    }
  }
  else {
    hoizontal <- c(x$x1[i]:x$x2[i])
    vertical <- c(x$y1[i]:x$y2[i])
    for (j in c(1:(abs(x$x1[i]-x$x2[i])+1))) {
      de<-data.frame(hoizontal[j],vertical[j])
      names(de)<-c('x','y')
      df <- rbind(df, de)      
    }
  }
  
}

ans <- df %>% count(x,y)

nrow(filter(ans,n>1))





