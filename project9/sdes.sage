from sage.crypto.block_cipher.sdes import SimplifiedDES
sdes = SimplifiedDES()

p = 00000000
k = 0000000000

#p = 00001111
#k = 0000011111

#p = 11111111
#k = 0011001100

#p = 11110000
#k = 1111111111

c = sdes.encrypt(p,k)
plaintxt = sdes.decyprt (c,k)
plaintxt == p

