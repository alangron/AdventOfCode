import pandas as pd

filename = "Data/day3.csv"
df = pd.read_csv(filename, sep='\s+')

alpha = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
rdict = dict([ (x[1],x[0]) for x in enumerate(alpha) ])

# Part 1
answers = []

for i in df['col']:
    stop = 0
    length = len(i)
    A = i[0:int(length/2)]
    B = i[int(length/2):]

    for x in A:
        if x in B and stop == 0:
            answers = answers + [rdict[x]+1]
            stop = 1

print(sum(answers))

# Part 2
answers = []

for i in range(0,len(df),3):
    stop = 0
    A = df.loc[i,'col']
    B = df.loc[i+1,'col']
    C = df.loc[i+2,'col']
    for x in A:
        if x in B and x in C and stop == 0:
            answers = answers + [rdict[x]+1]
            stop = 1
print(sum(answers))
