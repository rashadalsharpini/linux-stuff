from collections import Counter

def isprime(n):
    if n <= 1:
        return False
    if n <= 3:
        return True
    if n % 2 == 0 or n % 3 == 0:
        return False
    i = 5
    while i * i <= n:
        if n % i == 0 or n % (i + 2) == 0:
            return False
        i += 6
    return True


def find_mex(S):
    present = [False] * (len(S) + 1)
    for num in S:
        if num < len(present):
            present[num] = True
    for i in range(len(present)):
        if not present[i]:
            return i
    return len(S)


def solve():
    pass


if __name__ == '__main__':
    #for _ in range(int(input())):
    solve()
    
