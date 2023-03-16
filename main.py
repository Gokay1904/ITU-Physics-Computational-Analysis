import numpy as np
import random



def myvecfunction(N):
    mtx = np.zeros(N)
    numoftries = 1

    while(True):
        randidx = random.randint(0,N-1)

        mtx[randidx] = 1
        if randidx == 0:
            mtx[randidx + 1] = -1

        elif randidx == N-1:
            mtx[randidx - 1] = -1

        else:
            mtx[randidx-1] = -1
            mtx[randidx+1] = -1

        print(mtx)
        print("Sum", sum(mtx))
        numoftries +=1
        if(sum(mtx) == 0):
            break
def mymtxfunction(N):
    mtx = np.zeros((N,N))
    numoftries = 1

    while(True):
        i = random.randint(0,N-1)
        j = random.randint(0,N-1)

        mtx[i, j] = 1

        if i == 0:
            if j == 0:
                mtx[i+1,j] = -1
                mtx[i,j+1] = -1
            elif j == N-1:
                mtx[i - 1, j] = -1
                mtx[i, j + 1] = -1

            else:
                mtx[i - 1, j] = -1
                mtx[i + 1, j] = -1
                mtx[i, j + 1] = -1

        if i == N-1:
            if j == N-1:
                mtx[i, j - 1] = -1
                mtx[i - 1, j] = -1
            elif j == 0:
                mtx[i, j + 1] = -1
                mtx[i - 1, j] = -1
            else:
                mtx[i, j - 1] = -1
                mtx[i + 1, j] = -1
                mtx[i - 1, j] = -1

        if j == 0:
            if i !=0 | i !=N-1:
                mtx[i+1, j] = -1
                mtx[i, j+1] = -1
                mtx[i, j-1] = -1


        if j == N-1:
            if i != 0 | i != N-1:
                mtx[i-1, j] = -1
                mtx[i, j + 1] = -1
                mtx[i, j - 1] = -1

        if (j > 0 | j < N-1) & ( i > 0 | i<N-1):
            mtx[i - 1, j] = -1
            mtx[i+1, j] = -1
            mtx[i, j + 1] = -1
            mtx[i, j - 1] = -1

        sum = 0

        for i in range(0,N):
            for j in range(0,N):
                sum += mtx[i,j]
        print(mtx)
        print("Sum", sum)
        numoftries +=1
        if(sum == 0):
            break


N = int(input("Give N"))


if N % 2 == 0:
    mymtxfunction(N)


