def chiffre_Cesar(texte, key):
    result = ""
    for caractere in texte:
        caractere_chiffre = (ord(caractere) - key) % 256
        result += chr(caractere_chiffre)
    return result

def dechiffre_Cesar(texte, key):
    texte_dechiffre = []
    for caractere in texte:
        caractere_dechiffre = (ord(caractere) + key) % 256
        texte_dechiffre.append(chr(caractere_dechiffre))
    return ''.join(texte_dechiffre)

def main():
    ascii = "info"
    key = 5
    caracteres = dechiffre_Cesar(ascii, key)
    print(caracteres)

def frequence(texte):
    L[i] = [66, 3]

    

main()