/*
 * Compile with:
 *   gcc -Wall -o even_odd even_odd.c
 * Run: ./even_odd [NUMBER]
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int number = atoi(argv[1]);
  printf("You entered: %d\n", number);
  if (number & 1) {
    printf("Odd Number\n");
  } else {
    printf("Even Number\n");
  }
}
