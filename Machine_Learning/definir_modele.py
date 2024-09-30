#!/usr/bin/env python3


# Données artificielles
X = [[0, 0], [1, 1]]
y = [0, 1]


# la classe du modèle
from sklearn.linear_model import LinearRegression

#instanciation du modèle
mdl = LinearRegression()
mdl = mdl.fit(X, y)

# algo de Héron
x = 1
precision = 0.001

while(abs(x**2-2) > precision) : # abs = valeur absolue
    x = (x+ 2/x)/2


print(x)