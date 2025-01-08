import math as math
import numpy as np



def est_nb_premiers(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5)+1):
        if n % i == 0:
            return False
    return True 

def generateur_nb_premiers():
    n = 2
    while True:
        if est_nb_premiers(n):
            yield n # retourne un générateur, ça ne calcul que les éléments vraiment utilisés
        n += 1

# créer un générateur d'objet
nb_premiers = generateur_nb_premiers()

n = int(input("Quel est le nombre de nombre premiers que tu veux générer ? "))

# génère les nombres premiers 
print ("Voici les ",n, "premiers nombres premiers")
for _    in range(n):
    print(next(nb_premiers))

def gen_key(p, q):
    n = p * q
    phi = (p - 1) * (q - 1)
    e = 3
    while phi % e == 0:
        e += 2
    d = pow(e, -1, phi)
    return (e, n), (d, n)



def chiffrement_RSA(m, key):
    e, n = key
    return pow(m, e, n)

def dechiffrement_RSA(c, key):
    d, n = key
    return pow(c, d, n)

def main():
    p = int(input("Entrez le premier nombre premier : "))
    q = int(input("Entrez le second nombre premier : "))
    (e, n), (d, n) = gen_key(p, q)
    print("Clé publique : (e =", e, ", n =", n, ")")
    print("Clé privée : (d =", d, ", n =", n, ")")
    m = int(input("Entrez le message à chiffrer (un entier) : "))
    c = chiffrement_RSA(m, (e, n))
    print("Message chiffré :", c)
    m2 = dechiffrement_RSA(c, (d, n))
    print("Message déchiffré :", m2)
    
if __name__ == "__main__":
    main()
