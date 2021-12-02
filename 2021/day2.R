library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day2.csv",header = FALSE) %>%
separate(V1, c("dir","val")) %>%
mutate(val=as.numeric(val))
len <- nrow(x)

# part 1
horizontal = sum(as.numeric(filter(x,dir=='forward')$val))
depth = sum(as.numeric(filter(x,dir=='down')$val)) - sum(as.numeric(filter(x,dir=='up')$val))
horizontal*depth

# part 2
horizontal = 0
depth = 0 
aim = 0

for (i in c(1:len)) {
  if (x$dir[i]=='forward') {
    horizontal = horizontal + x$val[i]
    depth = depth + (x$val[i]*aim)
  }
  if (x$dir[i]=='down') {
    aim = aim + x$val[i]
  }
  if (x$dir[i]=='up') {
    aim = aim - x$val[i]
  }
}
horizontal*depth
