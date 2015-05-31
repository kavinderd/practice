/*
 * Compile With:
 *   gcc -Wall -o sum_to_n sum_to_n.c
 * Run ./sum_to_n n
 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  int number = atoi(argv[1]);

  int sum = (number * (number + 1))/ 2;
  printf("Sum = %d\n", sum);
  return 0;
}
