/*
 * Compile with:
 *   gcc -Wall -o positive_negative positive_negative.c
 * Run: ./positive_negative [NUMBER]
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int number = atoi(argv[1]);
  printf("You entered %d\n", number);

  if (number > 0)
    printf("Positive Number\n");
  else if (number < 0)
    printf("Negative Number\n");
  else
    printf("Zero\n");

}
