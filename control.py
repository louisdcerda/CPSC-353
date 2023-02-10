'''
 Names: Louis Cerda and Finn Dugan
 Github Username: louisdcerda
 Class: CPSC 353
 Date Submitted: Feb 9, 2023
 Assignment: Project 1                                                                     
 Description: This program encrypts and decrypts a ch using a permutated version of the alphabet
'''

import os
# os.system('python3 --preparse project1.py')
# os.system('mv project1.sage.py project1.py')
import sys
import project1 as pr 

def init(args):
    mode = args[1]
    key_file = open(args[2],'r')
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key_file, fin, fout    

def process(args):
    mode, key_file, fin, fout = init(args)
    key = int(key_file.read())

    data = fin.read().upper()
    for ch in data:
        if (ch.isalpha()):
            if (mode == 'enc'):
                ch = pr.encrypt(ch,key)
            if (mode == 'dec'):
                ch = pr.decrypt(ch,key)
        fout.write(ch)

    fin.close()
    fout.close()

def write_key(file_name):
    key_file = open(file_name,'w') 
    key = pr.key_gen()
    key_file.write(key)
    key_file.close()
'''
usage: python3 caesar_tst.py mode key_file input output
#where:
 mode is enc or dec
 key_file is the name of the file containing the key
 input is the name of the file containing text to be encrypted/decrypted
 output is the name of the file containing the result of the encrypt/decrypt operation 
'''
def main():
    #generate, store key
    if len(sys.argv) == 2:
        write_key(sys.argv[1])
        return

    #encrypt or decrypt
    process(sys.argv)
main()
