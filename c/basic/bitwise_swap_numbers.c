/*
 * Compile With:
 *   gcc -Wall -o bitwise_swap_numbers bitwise_swap_numbers.c
 * Run With: ./bitwise_swap_numbers
 */

#include <stdio.h>

int main() {
  int num1 = 0;
  int num2 = 0;

  printf("Enter two numbers: ");
  scanf("%d %d", &num1, &num2);

  num1 = num1 ^ num2;
  num2 = num1 ^ num2;
  num1 = num1 ^ num2;

  printf("Numbers swapped: %d %d", num1, num2);
}
