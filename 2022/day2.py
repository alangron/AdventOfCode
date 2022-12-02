import pandas as pd

# opening the file in read mode
filename = "Data/day2.csv"

df = pd.read_csv(filename, sep='\s+')

# Part 1
for x in range(0,len(df)):

    if df.loc[x,'col1'] == 'A':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'result'] = 3
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'result'] = 6
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'result'] = 0
        
    
    
    if df.loc[x,'col1'] == 'B':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'result'] = 0
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'result'] = 3
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'result'] = 6
            
    if df.loc[x,'col1'] == 'C':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'result'] = 6
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'result'] = 0
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'result'] = 3
        
        
    if df.loc[x,'col2'] == 'X':
        df.loc[x,'score'] = 1    
    if df.loc[x,'col2'] == 'Y':
        df.loc[x,'score'] = 2    
    if df.loc[x,'col2'] == 'Z':
        df.loc[x,'score'] = 3
        
print(sum(df['score'])+sum(df['result']))

# Part 2
df = pd.read_csv(filename, sep='\s+')

for x in range(0,len(df)):

    if df.loc[x,'col1'] == 'A':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'score'] = 3
            df.loc[x,'result'] = 0
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'score'] = 1
            df.loc[x,'result'] = 3
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'score'] = 2
            df.loc[x,'result'] = 6
        
    if df.loc[x,'col1'] == 'B':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'score'] = 1
            df.loc[x,'result'] = 0
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'score'] = 2
            df.loc[x,'result'] = 3
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'score'] = 3
            df.loc[x,'result'] = 6
        
    if df.loc[x,'col1'] == 'C':
        if df.loc[x,'col2'] == 'X':
            df.loc[x,'score'] = 2
            df.loc[x,'result'] = 0
        if df.loc[x,'col2'] == 'Y':
            df.loc[x,'score'] = 3
            df.loc[x,'result'] = 3
        if df.loc[x,'col2'] == 'Z':
            df.loc[x,'score'] = 1
            df.loc[x,'result'] = 6
        
print(sum(df['score'])+sum(df['result']))

