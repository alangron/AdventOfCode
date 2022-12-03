import pandas as pd

# opening the file in read mode
filename = "Data/day2.csv"
df = pd.read_csv(filename, sep='\s+')
# Convert data to numeric
df = df.replace({'A','X'},'1').replace({'B','Y'},'2').replace({'C','Z'},'3')

# Part 1
# Take the difference between 2 values and add one. This gives 0 for a loss, 1 for a draw and 2 for a win
df['result'] = (df['col2'].astype(int) - df['col1'].astype(int) + 1) % 3

# Sum the initial secltion with 3x the result for part 1 answer
print(sum(df['col2'].astype(int))+3*sum(df['result']))

# Part 2
df['pick'] = (df['col2'].astype(int) + df['col1'].astype(int) - 2) % 3
df['pick'] = df['pick'].replace(0,3)
         
print(sum(3*(df['col2'].astype(int)-1))+sum(df['pick']))