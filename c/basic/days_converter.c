/*
 * Compile with: gcc -Wall -o days_converter days_converter.c
 * Run with: ./days_converter
 */

#include <stdio.h>

int DAYS_IN_YEAR = 365;
int DAYS_IN_WEEK = 7;

int main(void) {
  int input;
  int years, weeks, days;
  printf("Enter a number of days:");

  scanf("%d", &input);
  while (input > 0) {
    if( input / DAYS_IN_YEAR > 0 ){
      years = input / DAYS_IN_YEAR;
      input = input - ( DAYS_IN_YEAR * years);
    } else if (input / DAYS_IN_WEEK> 0) {
      weeks = input / DAYS_IN_WEEK;
      input = input - ( DAYS_IN_WEEK * weeks);
    } else {
      days = input;
      input = 0;
    }
  }

  printf("%d years, %d weeks, %d days", years, weeks, days);
}
