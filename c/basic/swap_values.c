/*
 * Compile with: 
 *   gcc -Wall -o swap_values swap_values.c
 * Run with ./swap_values
 */
#include <stdio.h>
const char QUIT  = 'q';

void swap(int *ptr1, int *ptr2){
  int tmp;
  tmp = *ptr1;
  *ptr1 = *ptr2;
  *ptr2 = tmp;
}

int main(void){
  int num1, num2;
  char input[50];
  char quit;

  while(1) {
    printf("Enter Two Numbers: ");
    fgets(input, 50, stdin);
    sscanf(input, "%c", &quit);
    if (quit == QUIT) {
      printf("Goodbye");
      return 0;
    } else {
      sscanf(input, "%d %d", &num1, &num2);
      swap(&num1, &num2);
      printf("Your numbers swapped: %d %d\n", num1, num2);
    }
  }
  return 0;
}
