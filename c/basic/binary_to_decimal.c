/*
 * Compile With:
 *   gcc -Wall -o binary_to_decimal binary_to_decimal.c
 * Run: ./binary_to_decimal
 */
#include <stdio.h>
const char QUIT = 'q';

int main(){

  int originalNumber, num;
  int base = 1;
  int decimalNumber = 0;
  char input[50];
  char quit;

  while(1){
    printf("Enter a number in binary form (1's and 0's):");
    fgets(input, 50, stdin);

    sscanf(input, "%c", &quit);
    if (quit == QUIT){
      printf("Goodbye\n");
      return 0;
    } else {
      sscanf(input, "%d", &originalNumber);
      num = originalNumber;
      while (num > 0){
        int rem = num % 10;
        decimalNumber = decimalNumber + rem * base;
        num = num / 10;
        base = base * 2;
      }
      printf("Your number in decimal form is: %d\n", decimalNumber);
    }
    decimalNumber = 0;
    base = 1;
  }
  return 0;
}
