from RSA import chiffrement_RSA, dechiffrement_RSA


def signerRSA(texte, d, n):
    m = int.from_bytes(texte.encode('utf-8'), 'big')
    c = pow(m, d, n)
    return (texte, c)

def verifierRSA(signature, e, n):
    texte, c = signature
    m = pow(c, e, n)
    texte2 = m.to_bytes((m.bit_length() + 7) // 8, 'big').decode('utf-8')
    return texte == texte2

print signerRSA("Bonjour", 2753, 3233)
print verifierRSA(("Bonjour", 2790), 17, 3233)




