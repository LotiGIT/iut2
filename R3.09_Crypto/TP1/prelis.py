def convert_ASCII(texte):
    code_ASCII = []
    for lettre in texte:
        code_ASCII.append(ord(lettre))
    return code_ASCII  # Retourner la liste après avoir parcouru tout le texte
    
def convert_CHAR(ascii):
    caracteres = []
    for code in ascii:
        caracteres.append(chr(code))
    return caracteres  # Déplacer le return en dehors de la boucle

def main():
    texte = "Bonjour"  # Définir une chaîne de caractères
    ascii = convert_ASCII(texte)
    print(ascii) # Afficher la liste des codes ASCII
    caracteres = convert_CHAR(ascii)
    print(caracteres)  

main()
