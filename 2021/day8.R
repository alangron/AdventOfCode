library(tidyverse)
x <- read.csv("GitHub/AdventOfCode/2021/data/day8_example.csv",header = FALSE) %>%
separate(V1, into = as.character(1:15), sep = " ")
len <- nrow(x)

answer <- 0
for (i in c(1:len)) {
  for (j in c(12:15)) {
    if (nchar(x[i,j]) %in% c(2,3,4,7)) {
      answer <- answer + 1
    }
  }
}
print(answer)


for (j in c(1:10)) {
  if (nchar(x[1,j]) == 2) {value1 <- x[1,j] }
}
for (j in c(1:10)) {
  if (nchar(x[1,j]) == 7) {value8 <- x[1,j] }
}
for (j in c(1:10)) {
  if (nchar(x[1,j]) == 4) {value4 <- x[1,j] }
}
for (j in c(1:10)) {
  if (nchar(x[1,j]) == 3) {value7 <- x[1,j] }
}
for (j in c(1:10)) {
  if (nchar(x[1,j]) == 6 && ) {value7 <- x[1,j] }
}

# value6 <- fgaecd (6 digits and doesn't have both of value 1)
# value3 <- fecdb (5 digits and contains both of value 1) 
# value5 <- fdcge (5 digits and contains the value in 6 that is shared with 1)
# value2 <- fabcd (only remaining 5 digits)
# value9 <- cbdgef (6 digits and contains all of value3)
# value0 <- agebfd (only remaining number)

