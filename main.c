#include <stdio.h>
#include "NumClass.h"
#include "math.h"

int main() {
    int start;
    int end;
    printf("please enter two integer numbers. \n");
    scanf("%d %d", &start ,&end);
    int primes [end - start + 1];
    int armstrongs [end  - start + 1];
    int palindromes[end - start + 1 ];
    int strongs [end - start + 1 ];
    int primesInx = 0;
    int armstrongsInx = 0;
    int palindromesInx = 0;
    int strongsInx = 0;
    for(int i = start; i <= end;)
    {
        if (isStrong(i) == 1) {
            strongs[strongsInx] = i;
            strongsInx++;
        }
        if (isPrime(i) == 1) {
            primes[primesInx] = i;
            primesInx++;
        }
        if (isArmstrong(i) == 1) {
            armstrongs[armstrongsInx] = i;
            armstrongsInx++;
        }
        if (isPalindrome(i) == 1) {
            palindromes[palindromesInx] = i;
            palindromesInx++;
        }
    }
    printf("The Armstrong numbers are:");
    for(int i = 0; i < armstrongsInx; i = i + 1 )
    {
        printf(" %d", armstrongs[i]);
    }
    printf("The Palindromes numbers are:");
    for(int i = 0; i <palindromesInx; i = i + 1)
    {
        printf(" %d", palindromes[i]);
    }
    printf("The Prime numbers are:");
    for(int i = 0; i < primesInx; i = i + 1)
    {
        printf(" %d", primes[i]);
    }
    printf("The Strong numbers are:");
    for(int i = 0; i < strongsInx; i = i + 1)
    {
        printf(" %d", strongs[i]);
    }
    return 0;
}