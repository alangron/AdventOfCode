x <- scan("GitHub/AdventOfCode/2021/data/day1.txt")

len = length(x)
answer = 0
answer2 = 0
for (i in c(1:(len-1))) {
  if (x[i]<x[i+1]) {
    answer = answer+1
  }
  if (x[i]<x[i+3]) {
    answer2 = answer2+1
  }
}
print(answer)
print(answer2)

