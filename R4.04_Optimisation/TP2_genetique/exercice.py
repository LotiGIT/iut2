import numpy as np
import numpy.random as rd


Lieux0=['Rennes', 'Brest', 'St Brieuc', 'Quimper']
Carte0 = np.array([ 
[0, 210, 95, 180], 
[210, 0, 126, 53],
[95, 126, 0, 113],
[180, 53, 113, 0]])

Lieux1=['Paris','Lyon','Nice','Nantes','Strasbourg','Montpellier','Lille',
        'Rennes','Reims','Saint-Étienne','Angers','Grenoble','Nîmes',
        'Aix-en-Provence','Brest']

Carte1=np.array([
        [   0,462,931,380,488,746,219,348,143,522,293,575,710,759,589],
        [462,  0 ,472,681,494,302,689,718,487, 62,594,107,251,299,970],
        [930,471, 0,1143,790,326,1157,1186,955,490,1062,465,279,176,1440],
        [380,682,1145,  0 ,860,824,597,107,515,662,  88,786,874,972,296],
        [487,491,788,860,  0  ,791,549,827,347,550,773,533,739,787,1069],
        [746,303,327,823,791,  0  ,963,895,787,322,771,297,56,154,1120],
        [217,690,1159,598,522,963,  0 ,572,199,749,511,803,938,986,759],
        [347,718,1186,106,827,894,572,  0 ,483,699,126,823,948,1013,241],
        [143,487,955,516,347,786,198,483,  0  ,546,429,600,735,783,725],
        [523, 64,491,661,552,322,750,698,548,  0  ,574,155,271,319,950],
        [293,595,1062,88,773,770,511,128,429,576,  0  ,700,824,890,377],
        [574,106,466,786,534,296,801,823,599,155,699,  0  ,245,293,1075],
        [711,252,281,872,740, 55,938,949,736,271,825,246,  0  ,108,1169],
        [757,298,178,970,786,153,984,1013,781,317,889,291,106,  0 ,1267],
        [590,971,1441,298,1070,1121,760,241,725,952,378,1076,1171,1269,0]])

def TrajetAlea(nVille):
    ville = list(range(1, nVille))
    rd.shuffle(ville)
    return ville

def PopAlea(nVille, p):
    reponse = []
    for i in range(p):
        reponse += [TrajetAlea(nVille)]
    return reponse

def LTrajet(t, carte):
    longueur = 0
    for i in range(len(t)-1):
        longueur += carte[t[i], t[i+1]]
    return longueur

def LPop(Population, Carte):
    longueur = []
    for i in Population:
        longueur.append(LTrajet(Population, Carte))
    return np.array(longueur) 

# print(PopAlea(5, 10))

# print (LTrajet([0, 2, 1, 3, 0], Carte0))

print(LPop(PopAlea(5, 10), Carte1))