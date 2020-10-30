import pandas as pd
import Bio

#insert path to excel files
data = pd.read_excel(r"/Users/karsonlychuk/Documents/Career/Work/druggable_genome_CRISPR_KO_lib_20180225.xls")

#column names that contain the gene and the sgRNA seqence
#make sure there are the correct number of column names to number of columns
c = ['gene', 'sgRNA']
df = pd.DataFrame(data, columns= c)

mydict = {}

count = 1
for index,row in df.iterrows():
    mydict[row['sgRNA']] = row['gene'] + "_" + str(count)
    count+=1

#uncomment to test if the dictionary looks correct
#print(mydict)

#can rename from lib.fasta to anything 
with open("lib.fasta", 'w') as fasta:
    for key,value in mydict.items():
        fasta.write(f">{value}\n")
        fasta.write(f"{key}\n")
    