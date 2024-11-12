#usr/bin/env python3
#-*- coding: utf-8 -*-
import numpy as np
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error
from math import sqrt



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
    erreur = sqrt(x**2-2)**2 #sqr = racine carrée

print(f"Erreur : {erreur}")
print(f"Approximation de la racine carrée de 2 : {x}")