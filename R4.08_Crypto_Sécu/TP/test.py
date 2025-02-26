
def est_quadratique(n, p):
    return pow (n, (p-1)//2, p) == 1

def nb_points_courbe(a, b, p):
    compteur = 0
    for x in range(p):
        F_x = (x **3 + a*x + b)%p
        if est_quadratique(F_x, p):
            compteur += 2
    compteur += 1 
    return compteur

# Params 

a = 5
b= 20
p = 97


num_points = nb_points_courbe (a, b, p)
print("Le nombre de points sur la courbe elliptique est :", num_points)
