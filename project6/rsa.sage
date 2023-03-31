def key_gen(size):
    range = (2**size)
    e = 17

    # gen p and q which are two random primes
    p = random_prime(range,proof=True)
    q = random_prime(range,proof=True)

    # check if gcd(e,(p-1)(q-1)) == 1
    # if not it will keep gen q until 
    pq = (p-1)*(q-1)
    while gcd(e, pq) != 1:
        q = random_prime(range,proof,True)
        pq = (p-1)*(q-1)
    # gen n and d using the algo
    n = p*q
    d = inverse_mod(e,pq)

    # writing public and private key to text file
    public = open("public_key.txt", "w")
    private = open("private_key.txt", "w")

    # public key n and e
    publicKey = str(n) + " " + str(e)
    public.write(publicKey) 


    # private key n and d
    privateKey = str(n) + " " + str(d)
    private.write(privateKey)

    private.close()
    public.close()
   
    return (n, e, d)

def encrypt(plain_text ,e ,n):
    mes = txt_to_num(plain_text)

    # rsa algo 
    encMes = power_mod(mes, e, n)
    return encMes

def decrypt(c, d, n):
    decMes = power_mod(c, d, n)
    text = num_to_txt(decMes)
    return text




#Converts a string to a decimal digit sequence
#msg_in is a string
def txt_to_num(msg_in):      
    #transforms string to the indices of each letter in the 8-bit ASCII table
    #ex: "AB" becomes [65,66]
    msg_idx = list(map(ord,msg_in))

    #The integers in the list, since they are ASCII, are in the range 0..255
    #These are treated, collectively, as a base 256 integer, but from left to right
    #rather than right to left
    #This sequence of integers is converted to base 10 
    #ex: [65,66] = 65*256^0 + 66*256^1 = 16961
    num = ZZ(msg_idx,256)
    return num 

#Converts a digit sequence to a string
#num_in is a decimal integer, constructed from a string using txt_to_num 
def num_to_txt(num_in):
    #transforms the base 10 num_in to a list of base 256 digits. 256^0 is on the left 
    msg_idx = num_in.digits(256)

    #maps each index to its associated character in the ascii table 
    m = map(chr,msg_idx)

    #transforms the list to a string
    m = ''.join(m)
    return m

def main():
    key = key_gen(100)
    text = "Hello world!"

    e = key[1]
    n = key[0]
    d = key[2]

    enc = encrypt(text, e, n)
    mes = decrypt(enc, d, n)
    print(mes)

main() 