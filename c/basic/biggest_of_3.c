/*
 * Compile With:
 *   gcc -Wall -o biggest_of_3 biggest_of_3.c
 * Run: ./biggest_of_3 NUMBER1, NUMBER2, NUMBER3
 */
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]){
  int largest = 0;
  int i;

  for(i = 1; i < argc; i++) {
    int current = atoi(argv[i]);
    if (current > largest)
      largest = current;
  }

  printf("The largest entered number = %d\n", largest);
  return 0;
}
