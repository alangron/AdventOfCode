import pandas as pd

# opening the file in read mode
filename = "Data/day2.csv"

df = pd.read_csv(filename, sep='\s+')

# Part 1

# Convert data to numeric and subtract them
df = df.replace({'A','X'},'1').replace({'B','Y'},'2').replace({'C','Z'},'3')

df['result'] = (df['col2'].astype(int) - df['col1'].astype(int)) % 3

# A difference of 1 is a win, 0 is a draw and 2 is a loss
for x in range(0,len(df)):
    if df.loc[x,'result'] == 0:
        df.loc[x,'score'] = 3
    if df.loc[x,'result'] == 1:
        df.loc[x,'score'] = 6
    if df.loc[x,'result'] == 2:
        df.loc[x,'score'] = 0
        
print(sum(df['col2'].astype(int))+sum(df['score']))
        

# Part 2
df = pd.read_csv(filename, sep='\s+')

df = df.replace({'A'},'1').replace({'B'},'2').replace({'C'},'3')
df = df.replace({'X'},'-1').replace({'Y'},'0').replace({'Z'},'1')

df['pick'] = (df['col2'].astype(int) + df['col1'].astype(int)) % 3

for x in range(0,len(df)):
    if df.loc[x,'pick'] == 0:
        df.loc[x,'pick'] = 3
         
for x in range(0,len(df)):
    if df.loc[x,'col2'] == '-1':
        df.loc[x,'score'] = 0
    if df.loc[x,'col2'] == '0':
        df.loc[x,'score'] = 3
    if df.loc[x,'col2'] == '1':
        df.loc[x,'score'] = 6
         
         
print(sum(df['pick'].astype(int))+sum(df['score']))
         

       
        
        
        
        
        
        