'''
 Name: Louis Cerda 
 Name: Finn Dugan
 Github Username: louisdcerda
 Class: CPSC 353
 Date Submitted: Mar 5, 2023
 Assignment: Project 4                                                                     
 Description: This program encrypts and decrypts a ch using the affine cipher
'''

import sys
os.system('sage --preparse project4.sage')
os.system('mv project4.sage.py project4.py')
import project4 as pr 
import pickle

def init(args):
    mode = args[1]
    key_file = open(args[2], 'rb')
    fin = open(args[3],'r')
    fout = open(args[4], 'w')
    return mode, key_file, fin, fout    

def process(args):
    mode, key_file, fin, fout = init(args)
    key = pickle.load(key_file)


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
    fout = open(file_name, 'wb')
    key = pr.key_gen()
    pickle.dump(key, fout)
    fout.close()

'''
usage: python3 project4.py mode output
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




# go into key writing mode so only pass in two args
# enc and dec for other two modes