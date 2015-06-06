/*
 * Compile With:
 *   gcc -Wall -o reverse_number reverse_number.c
 * Run: ./reverse_number
 */
#include <stdio.h>

const char QUIT = 'q';
int main() {
  int original, result;
  char input[50];

  while(1) {
    printf("Enter a number to reverse:");
    fgets(input, 50, stdin);
    
    char quit;
    sscanf(input, "%c", &quit);
    if (quit == QUIT) {
      printf("Goodbye\n");
      return 0;
    } else {
      sscanf(input, "%d", &original);
      result = 0;
      while (original > 0) {
        int rem = original % 10;
        result = result * 10 + rem;
        original = (original - rem) / 10;
      }
      printf("Reversed number: %d\n", result);
    }
  }
  return 0;
}
