#include "NumClass.h"
#include "math.h"

int factorial(int x){
    if (x == 1 || x == 0)
        return x;
    return (factorial (x-1))*x;
}

int isStrong(int num){
    double sum;
    sum=0;
    for (int i = num ; i > 0 ; i = i/10){
        sum = sum + factorial(num%10);
    }
    if (sum == num)
        return 1;
    else
        return 0;
}

/* will return if a number is prime*/
int isPrime(int n){
    for (int i=2 ; i< sqrt(n)+1 ; i= i+1){
        if (n%i == 0 )
            return 0;
    }
    return 1;
}