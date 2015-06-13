/*
 * Compile With: 
 *  gcc -Wall -o is_leap_year is_leap_year.c
 * Run: ./is_leap_year
 */

#include <stdio.h>

int main() {
  int input = 0;
  printf("Enter a year (yyyy): ");
  scanf("%d", &input);

  if ((input % 400) == 0) {
    printf("Is a Leap Year\n");
  } else if ((input % 100) == 0) {
    printf("Is not a Leap Year\n");
  } else if ((input % 4) == 0 ){
    printf("Is a Leap Year\n");
  } else {
    printf("Is Not a Leap Year\n");
  }
  return 0;
}
