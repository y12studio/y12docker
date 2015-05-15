import numpy as np
import scipy.fftpack
import pandas as pd
import pandas.io.data as web
import datetime

def hello():
  print("Hello World")

def sp500():
  start=datetime.datetime(2014, 1, 1)
  end=datetime.datetime(2015, 1, 1)
  # %5EGSPC sp500
  f = web.DataReader("%5EGSPC", 'yahoo', start, end)
  f['H-L'] = f.High - f.Low
  f['100MA'] = pd.rolling_mean(f['Close'], 100)
  f['Difference'] = f['Close'].diff()
  print(f.head())
  return f

def fft():
  # Number of samplepoints
  N = 600
  # sample spacing
  T = 1.0 / 800.0
  x = np.linspace(0.0, N*T, N)
  y = np.sin(50.0 * 2.0*np.pi*x) + 0.5*np.sin(80.0 * 2.0*np.pi*x)
  yf = scipy.fftpack.fft(y)
  xf = np.linspace(0.0, 1.0/(2.0*T), N/2)
  return (xf, 2.0/N * np.abs(yf[0:N/2]))