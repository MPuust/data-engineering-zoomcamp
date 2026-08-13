import sys
import pandas as pd

df = pd.DataFrame({'col1': [1,2], 'col2': [3,4]})

print(df.head())

df.to_parquet('output.parquet', engine='pyarrow')



