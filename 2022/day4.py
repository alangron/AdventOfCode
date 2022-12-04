import pandas as pd

filename = "Data/day4.csv"
df = pd.read_csv(filename)

df[['elf1a','elf1b']] = df['elf1'].str.split('-',expand=True)
df[['elf2a','elf2b']] = df['elf2'].str.split('-',expand=True)
df = df[['elf1a','elf1b','elf2a','elf2b']].astype(int)

count = 0

for x in range(0,len(df)):
    if (df.loc[x,'elf1a'] <= df.loc[x,'elf2a']) and (df.loc[x,'elf1b'] >= df.loc[x,'elf2b']):
        count = count + 1
    elif (df.loc[x,'elf2a'] <= df.loc[x,'elf1a']) and (df.loc[x,'elf2b'] >= df.loc[x,'elf1b']):
        count = count + 1

print(count)

count = len(df)

for x in range(0,len(df)):
    if (df.loc[x,'elf1b'] < df.loc[x,'elf2a']) or (df.loc[x,'elf1a'] > df.loc[x,'elf2b']):
        count = count - 1

print(count)