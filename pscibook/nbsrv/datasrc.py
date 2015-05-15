import pandas as pd

def hello():
    print("Hello World")

#
# import datasrc as dc
# f=dc.read_bitcoin()
# f[["Value","30MA","7MA"]].plot()
#
def read_bitcoin():
    dataurl='https://www.quandl.com/api/v1/datasets/BCHAIN/MKPRU.csv?trim_start=2013-01-01&trim_end=2015-05-01'
    df=pd.read_csv(dataurl,index_col='Date', parse_dates=True)
    df['7MA'] = pd.rolling_mean(df['Value'], 7)
    df['30MA'] = pd.rolling_mean(df['Value'], 30)
    df['120MA'] = pd.rolling_mean(df['Value'], 120)
    df['Difference'] = df['Value'].diff()
    return df
