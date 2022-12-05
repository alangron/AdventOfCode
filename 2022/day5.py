import pandas as pd

# opening the file in read mode
my_file = open("Data/day5.txt", "r")
  
# reading the file in to a list
data = my_file.read()
df = data.split("\n")


i = 0
for y in range(1,34,4):
    i = i + 1
    exec(f'col{i} = []')
    for x in range(0,8):
        if df[x][y] != ' ':
            exec(f'col{i} = col{i} + [df[x][y]]')

       
ins = pd.DataFrame(df[10:])[0].str.split(' ', expand=True)

ins = ins[[1,3,5]].rename(columns={1: "move", 3: "from", 5: "to"}).astype(int)

for j in range(0,len(ins)):
    move = ins.loc[j,'move']
    to = ins.loc[j,'to']
    from_ = ins.loc[j,'from']
    # exec(f'col{to} = col{from_}[:move][::-1] + col{to}') # Part 1
    exec(f'col{to} = col{from_}[:move] + col{to}') # Part 2
    exec(f'col{from_} = col{from_}[move:]')

print(col1[0],col2[0],col3[0],col4[0],col5[0],col6[0],col7[0],col8[0],col9[0])



