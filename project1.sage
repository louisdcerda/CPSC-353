'''
 Name: Louis Cerda and Finn Dugan
 Class: CPSC 353
 Date Submitted: Feb 2, 2023
 Assignment: Project 1                                                                     
 Description: This program encrypts and decrypts a ch using a permutated version of the alphabet
'''
import random



'''
Generates and returns the key used in the transposition cipher.  This will include a random permutation of the alphabet.   The data structure is your design. 
'''

def key_gen():
    # creating dicts and initial alphabet
    enc = dict()
    dec = dict()
    alpha = [chr(x) for x in range(65,91)]

    # permute the alpha
    random.shuffle(alpha)

    # mapping the permutated alpha to the original ch and vice versa for the dec dict
    for i, ch in enumerate(alpha, start=65):
        enc[chr(i)] = ch
        dec[ch] = chr(i)
    return [enc,dec]


'''
Returns the encryption of ch using a permuted alphabet which is part of key.
'''
def encrypt(ch, key):
    # grabbing ch and inputting it intop the key and returning the char
    enc = key[ch]
    return enc

'''
Returns the decryption of ch using a permuted alphabet which is part of key.  decrypt is the inverse of encrypt
'''
def decrypt(ch, key):
    dec = key[ch]
    return dec




# TESTING PROJECT
key = key_gen()
print("D maps to -> " + encrypt("D", key[0]))
enc = encrypt("D", key[0])
print(enc + " maps to -> " + decrypt(enc, key[1]))

