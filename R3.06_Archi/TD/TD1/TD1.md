# Tableau adresse ip

| Numéro du réseau  | Masque décimal ou CIDR | Nombre d'@ip | première @ip | dernière @ip | @ip de broadcast |
| :---------------:|:---------------:|:-----:|:-----:|:-----:|:-----:|
| 181.72.27.64/28 | 255.255.255.240 | 2^(32-28)-2 = 14 | 181.72.27.65 | 181.72.27.78 | 181.72.27.79 |
| 81.12.32.0/25  | 255.255.255.128 | 2^(32-25)-2 = 126 | 81.12.32.1 | 81.12.32.126 | 81.12.32.127 |
| 81.12.32.0/20  | 255.255.240.0 | 2^(32-20)-2 = 4094 | 81.12.32.1 | 81.12.47.254 | 81.12.47.255 |
|1.2.0.0 masque 255.255.128.0| /25 | 126 | 1.2.0.1 | 1.2.0.126 | 1.2.0.127 |
|  12.81.27.48/30 | 255.255.255.252 | 2^(32-30)-2 =  2 |  |  |  |
| 72.27.13.128 masque 255.255.255.240 |  |  |  |  |  |
| 6.27.16.0 masque 255.255.254.0 |  |  |  |  |  |
| 7.8.64.0 masque 255.255.252.0 |  |  |  |  |  |
| 7.8.64.0 masque 255.255.248.0 |  |  |  |  |  |
| 7.8.64.0 masque 255.255.240.0 | /20 | 4094 | 7.8.64.1 | 7.8.79.254 | 7.8.79.255 |


# QCM

- 1 : machine
- 2 : machine
- 3 : broadcast
- 4 : broadcast
- 5 : machine
- 6 : réseau
- 7 : machine
- 8 : réseau
- 9 : machine
- 10 : machine


# Architecture réseau et affectation d’dresses

Question 1) 
- NOMBRE DE RESEAUX = 4 LAN + 2 Inter-site = 6 ss réseau

Question 2)
- CIDR : -28 => 255.255.255.240

Question 3)
- -28 => 16 - 6 = 10 sous réseaux pour le futur 

Question 4)
- 149.20.30.0/28
- 149.20.30.16/28
- 149.20.30.48/28
<br>...
<br>...
<br>...
- 149.20.30.240/28

Question 5)
- 10 sous réseaux libres

Question 6) 
- L'erreur est que ce soit linéaire, dans la vraie vie on fait un découpage dynamique, adaptatif, qu'on tient en compte la nature du réseau.
