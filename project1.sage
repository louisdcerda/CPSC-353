# cpsc 353 project 1 
# by: Louis Cerda

import random
'''
Generates and returns the key used in the transposition cipher.  This will include a random permutation of the alphabet.   The data structure is your design. 
'''

def key_gen():
    enc = dict()
    dec = dict()
    alpha = [chr(x) for x in range(65,91)]
    remaining = [chr(x) for x in range(65,91)]

    # permutes the alpha
    random.shuffle(alpha)

    for i in range(len(alpha)):
        enc[remaining[i]] = alpha[i]
        dec[alpha[i]] = remaining[i]

    return [enc,dec]


'''
Returns the encryption of ch using a permuted alphabet which is part of key.
'''
def encrypt(ch, key):
    # grabbing ch and inputting it intop the key and returning the char
    enc = key[ch]
    print(enc)
    return enc

'''
Returns the decryption of ch using a permuted alphabet which is part of key.  decrypt is the inverse of encrypt
'''
def decrypt(ch, key):
    dec = key[ch]
    print(dec)
    return dec



key = key_gen()
for i in key: print(i)
encrypted = encrypt("A",key[0])
decrypt(encrypted, key[1])