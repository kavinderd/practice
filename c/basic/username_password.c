/*
 * Compile with:
 *   gcc -Wall -o username_password username_password.c
 * Run: ./username_password
 */

#include <stdio.h>

int main() {
  char username[11], password[11], tmp;

  printf("Enter your username ( 10 characters or less):");
  fgets(username, 11, stdin);
  printf("Enter your password (10 characters or less):");
  int i = 0;
  tmp = '0';
  while (tmp != '\n' && tmp != EOF) {
    tmp = getchar();
    password[i] = tmp;
    printf("*");
    i++;
  }
  password[i] = '\0';
  printf("\n");
  printf("Your username is %s", username);
  printf("Your password is %s", password);
}
