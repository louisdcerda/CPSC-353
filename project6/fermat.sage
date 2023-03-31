# factors an odd interger using fermats technique
def fermat(n):
    if is_prime(n) or n.is_square():
        print("n is prime or is a perfect sqaure \n")
        quit()
    else:
        # opening a file in write mode
        file1 = open("feramt_fact.out", "w")

        # starting at 1 and adding to sum which is init to n 
        start = 1
        sum = n 
        # while sum is not a perf square one is added to start, sqared and added to sum
        while sum.is_square() == False:
            # print(start , " " , sum)
            text = str(start) + " " + str(sum) + "\n" 
            file1.write(text)

            start += 1
            sum = n + start * start

        # print(start , " " , sum)
        # writing to file final result before spitting out factors
        text = str(start) + " " + str(sum) + "\n" 
        file1.write(text)

        # calc factors from alg above and writing it out
        x = sqrt(sum)
        y = start
        # print(x+y , " " , x-y)
        text = str(x+y) + " " + str(x-y) + "\n"
        file1.write(text)

        # closing file
        file1.close()

fermat(119143)
