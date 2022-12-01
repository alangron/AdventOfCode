
import pandas as pd

# opening the file in read mode
my_file = open("Data/day1.txt", "r")
  
# reading the file in to a list
data = my_file.read()
df = data.split("\n")

# Replace missings with -1 so all values are an integer and convert type to int
for i in range(len(df)):
    if df[i] == '':
        df[i] = '-1'

df = [int(x) for x in df]

# Part 1
total = 0
maxcal = 0
vals = []

for x in range(0,len(df)):
    if df[x] != -1:
        total = total + df[x] 
    else:
        if total > maxcal:
            maxcal = total
        vals = vals + [total]
        total = 0
        
print(maxcal)


# Part 2
vals.sort(reverse=True)
print(sum(vals[0:3]))
