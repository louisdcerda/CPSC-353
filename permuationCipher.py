'''
Generates and returns the key used in the transposition cipher.  This will include a random permutation of the alphabet.   The data structure is your design. 
'''
from email import charset


def key_gen():
    enc = dict()
    dec = dict()

    # permuation and mapping
    # TODO

    return dec + enc



'''
Returns the encryption of ch using a permuted alphabet which is part of key.
'''
def encrypt(ch, key):
    # grabbing ch and inputting it intop the key and returning the char
    enc = key[0][ch]
    return ch

'''
Returns the decryption of ch using a permuted alphabet which is part of key.  decrypt is the inverse of encrypt
'''
def decrypt(ch, key):
    dec = key[1][ch]
    return ch
    
