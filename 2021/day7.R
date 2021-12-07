library(tidyverse)

x <- scan("GitHub/AdventOfCode/2021/data/day7.csv", sep=",")
x <- as.numeric(unlist(x))


answer <- 9999999999
for (i in c(1:99999)) {
  if (sum(abs(x - i)) < answer) {
    answer <- sum(abs(x - i))
  }
}
print(answer)


answer <- 9999999999
for (i in c(1:99999)) {
  diff <- abs(x - i)
  test <- sum((diff+1)*((diff-1)/2)+(diff+1)/2)
  if (test < answer) {
    answer <- test
  }
}
print(answer)

