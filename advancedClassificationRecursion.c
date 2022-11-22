#include "NumClass.h"
#include "math.h"
#include <stdlib.h>
/* will return if a number is Armstrong number
An Armstrong number is an n-digit number that is equal to the sum of the nth powers of its digits.
*/
int isArmstrong(int x){
    int original = x;
    int sum = IsArmstrong(x,floor(log10(abs(x)))+1);
    if(sum == original)
        return 1;
    return 0;
}

int IsArmstrong(int x, int len){
    if(x == 0)
        return 0;
    return pow(x % 10,len) + IsArmstrong(x/10, len);
}

/* will return if a number is a palindrome */
int isPalindrome(int x){
    int len = (int) ( floor( log10( abs(x) )+1 ) );
    int firstDigit = x/( (int)(pow(10,len-1)) );
    int lastD = x % 10;
    if(firstDigit != lastD) {
        return 0;
    }
    if(len == 1) {
        return 1;
    }
    x = x / 10;
    x = x % ( (int)(pow(10,len-1)) );
    return isPalindrome(x);

}
