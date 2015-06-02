/*
 * Compile with: 
 *   gcc -Wall -o divisible_by_5 divisible_by_5.c
 * Run ./divisible_by_5
 */
#include <stdio.h>

int num1;
int num2;
const char QUIT = 'q';
char input[50];

int main(){
    
  while(1) {
    printf("Enter two numbers (first less than second):");
    
    fgets(input, 50, stdin);
    char quit;
    sscanf(input, "%c", &quit);
    if (quit == QUIT) {
      printf("Goodbye");
      return 0;
    } else {
      sscanf(input, "%d %d", &num1, &num2);
      int result = ((num2 - num1)/5) + 1;
      printf("There are %d multiples of 5 in this range\n", result);
    }
  }
  return 0;
}
