/*
 * Compile With:
 *   gcc -Wall -o num_palindrome_check num_palindrome_check.c
 * Run: ./num_palindrome_check
 */

#include <stdio.h>

char QUIT = 'q';

int main(){
  int num;
  int newNumber = 0;
  int originalNumber;
  char string[100];
  char quit;
  
  while(1) {
    printf("Enter a Number:");
    fgets(string, 100, stdin);
    
    sscanf(string, "%c", &quit);
    if (quit == QUIT) {
      printf("Goodbye\n");
      return 0;
    } else {

      sscanf(string, "%d", &originalNumber);
      printf("You entered %d\n", originalNumber);
      num = originalNumber;

      
      while(num > 0) {
        int tmp = num % 10;
        num = (num - tmp)/10;
        newNumber = newNumber * 10 + tmp;
      }

      if (newNumber == originalNumber)
        printf("Number is a Palindrome\n");
      else
        printf("Number is not a Palindrome\n");

      newNumber = 0;
    }
  }
}

