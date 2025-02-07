import numpy as np
import math




def f1prime(x):
    return 2*x-4

def f2prime(x):
    return 3*x**2-6

def f3prime(x):
    return math.e ** x - 10

def Gradient1D(x0, alpha, n, fprime):
    x = x0
    for i in range (n):
        x = x - alpha * fprime(x)
    return x


print(f1prime(2))
print(f2prime(0))
print(f3prime(1))




def df1x(x, y):
    return 4*x +2 + y

def df1y(x, y):
    return 10*y + x

def df2x(x,y):
    return 2*x - 1.9

def df2y(x,y):
    return 2*y

def Gradient2D(dfx, dfy, x0, y0, alpha, n):
    for i in range(n):
        x0, y0 = x0 - alpha * dfx(x0, y0), y0 - alpha * dfy(x0, y0)
    return x0, y0

print(Gradient2D(df1x, df1y, 0, 0, 0.1, 10000))


def dFa(a, b):
    return 13.5632*a + 11.44*b - 90.4

def dFb(a, b):
    return 10*b + 11.44*a - 72  

print("\nLes enfants :")
print(Gradient2D(dFa, dFb, 20, -10, 0.05, 1000))


tailles = [[0.84, 0.98, 1.14, 1.32, 1.44]]
ages = [[2, 4, 8, 10, 12]]

