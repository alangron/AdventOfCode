import pandas as pd
import string

filename = "Data/day3.csv"
df = pd.read_csv(filename, sep='\s+')

alpha = dict(zip(string.ascii_letters, range(1, 53)))

# Part 1
answer = 0

for i in df['col']:
    stop = 0
    A = i[0:int(len(i)/2)]
    B = i[int(len(i)/2):]

    for x in A:
        if x in B and stop == 0:
            answer = answer + alpha[x]
            stop = 1

print(answer)

# Part 2
answer = 0

for i in range(0,len(df),3):
    stop = 0
    A = df.loc[i,'col']
    B = df.loc[i+1,'col']
    C = df.loc[i+2,'col']
    for x in A:
        if x in B and x in C and stop == 0:
            answer = answer + alpha[x]
            stop = 1
print(answer)

