/*
 * Compile With:
 *   gcc -Wall -o decimal_to_binary decimal_to_binary.c
 * Run: ./decimal_to_binary
 */
#include <stdio.h>

int main() {
  char input[10];
  int original, rem;
  int stack[32] = {0};
  int index = 0;
  
  printf("Enter a decimal number:");
  fgets(input, 10, stdin);
  sscanf(input, "%d", &original);

  while (original > 0) {
    rem = original%2;
    stack[index] = rem;
    original = original >> 1;
    index++;
  }
  
  printf("Binary Representation:");
  for (int i = 31; i >=0; i--) {
    printf("%d", stack[i]);
  }
  printf("\n");
  
}
