x <- scan("GitHub/AdventOfCode/2021/data/day1.txt")

# Initial solution
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


# Investigating lead/lag to remove loops

y <- lead(x,1)
z = x-y
sum((z < 0)[-len])

y <- lead(x,3)
z = x-y
sum((z < 0)[1:(len-3)])
