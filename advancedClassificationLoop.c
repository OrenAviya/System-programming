//
// Created by aviya on 11/17/22.
//

#include "advancedClassificationLoop.h"
#include "NumClass.h"
#include "math.h"
#include <stdlib.h>
//returns the length of the input integer.
int length (int x){
    return floor(log10(abs(x)))+1;
}

/* will return if a number is Armstrong number
        An Armstrong number is an n-digit number that is equal to the sum of the nth powers of its digits.
For Example: 407 = 4^3 + 0^3 + 7^3 = 64 + 0 + 343 = 407
*/

int isArmstrong(int x){
    int len = length(x);
    int original = x;
    int sum = 0;
    while(x > 0){
        int d = x % 10;
        sum = sum + (pow(d,len)) ;
        x = x/10;
    }
    if(sum == original)
        return 1;
    return 0;
}
/* will return if a number is a palindrome */
int isPalindrome(int x){
    int len = length(x);
    char charArray[len];
    int original = x;
    for( int i =0; i < len;  i++){
        charArray[len -i -1] = (char)(x % 10);
        x = x/10;
    }
    int isP = 1;
    for(int j = 0; (j <= len/2) && (isP == 1) ; j++){
        if(ca[j] != charArray[len - j -1])
            isP = 0;
    }
    return isP;

}