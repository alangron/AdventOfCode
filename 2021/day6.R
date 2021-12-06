library(tidyverse)

x <- scan("GitHub/AdventOfCode/2021/data/day6.csv", what="", sep=",")
x <- as.numeric(unlist(x))

count0 <- as.double(length(x[x==0]))
count1 <- length(x[x==1])
count2 <- length(x[x==2])
count3 <- length(x[x==3])
count4 <- length(x[x==4])
count5 <- length(x[x==5])
count6 <- length(x[x==6])
count7 <- length(x[x==7])
count8 <- length(x[x==8])



for (z in c(1:256)){
  count0_new <- count1
  count1_new <- count2
  count2_new <- count3
  count3_new <- count4
  count4_new <- count5
  count5_new <- count6
  count6_new <- count7 + count0
  count7_new <- count8
  count8_new <- count0
  
  count0 <- count0_new
  count1 <- count1_new
  count2 <- count2_new
  count3 <- count3_new
  count4 <- count4_new
  count5 <- count5_new
  count6 <- count6_new
  count7 <- count7_new
  count8 <- count8_new
  
  
}
print(format(count0+count1+count2+count3+count4+count5+count6+count7+count8, digits=14))