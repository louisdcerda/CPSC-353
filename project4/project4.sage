'''
 Name: Louis Cerda
 Name: Finn Dugan
 Github Username: louisdcerda
 Class: CPSC 353
 Date Submitted: Mar 5, 2023
 Assignment: Project 4                                                        
 Description: This program encrypts and decrypts text using the affine cipher
'''
import random


'''
Generates and returns the key used in the transposition cipher.  This will include a random permutation of the alphabet.   The data structure is your design. 
'''
    
def key_gen():
    random.seed(None)
    betasPoss = [1,3,5,7,9,11,15,17,19,21,23,25]
    
    beta = random.choice(betasPoss)
    alpha = random.randint(0,26)
    alphaInv = inverse_mod(alpha,26)

    return (alpha,alphaInv,beta)


'''
Returns the encryption of ch using a permuted alphabet which is part of key.
'''
def encrypt(ch, key):
    # grabbing vars from key tuple
    alpha = key[0]
    beta = key[2]

    ch = ord(ch)
    ch = (alpha * ch + beta) % 26
    return chr(ch)
'''
Returns the decryption of ch using a permuted alphabet which is part of key.  decrypt is the inverse of encrypt
'''
def decrypt(ch, key):
    alphaInv = key[1]
    beta = key[2]

    ch = ord(ch)
    ch = alphaInv * (ch - beta) % 26
    return chr(ch)
