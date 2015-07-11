/*
 * Tic Tac Toe 2 player C implementation
 * 
 * Compile With: gcc -Wall -o tic-tac-toe tic-tac-toe.c
 * Run With ./tic-tac-toe
 */

#include <stdio.h>
const int MAX_MOVES = 9;
const char *player_names[2] = {"Player 1", "Player 2"};
const char *player2 = "Player 2";
const char moves[2] = { 'O', 'X'};

void setupBoard(char board[][3], char character) {
  for (int i = 0; i < 3; i++) {
    for(int j = 0; j < 3; j++) {
      board[i][j] = character;
    }
  }
}

void displayBoard(char board[][3]){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      printf("%c", board[i][j]);
      if( j < 2)
        printf(" | ");
    }
    printf("\n");
    if( i < 2)
     printf("----------");
    printf("\n");
  }
}

int checkRow(char board[][3], char move) {
  int row, col, same_count;

  for (row = 0; row < 3; row++) {
    same_count = 0;
    for (col = 0; col < 3; col++) {
      if (board[row][col] == move)
        same_count += 1;
    }
    if (same_count == 3)
      break;
  }
  return same_count == 3;
}

int checkCol(char board[][3], char move) {
  int row, col, same_count;

  for (col = 0; col < 3; col++) {
    same_count = 0;
    for ( row = 0; row < 3; row++) {
      if (board[row][col] == move) 
        same_count += 1;
    }
    if (same_count == 3)
      break;
  }
  return same_count == 3;
}

int checkDiag(char board[][3], char move) {
  int row, col, same_count;
  row = 0;
  col = 0;
  same_count = 0;
  while (board[row][col] == move ) {
    same_count += 1;
    row += 1;
    col += 1;
  }
  if (same_count == 3) 
    return 1;

  row = 0;
  col = 2; 
  same_count = 0;
  while (board[row][col] == move) {
    same_count += 1;
    row += 1;
    col -= 1;
  }
  return same_count == 3;
}
int isWinningMove(char board[][3], char move) {
  return checkRow(board, move) || checkCol(board, move) || checkDiag(board, move);
}

int main() {
  char board[3][3];
  char blank = ' ';
  int current_player = 0;
  int row_move, col_move;

  setupBoard(board, blank);
  displayBoard(board);
  
  while (1) {
    printf("%s, your move ( enter row 0-2 and column 0-2)", player_names[current_player]);
    scanf("%d %d", &row_move, &col_move); 
    if (board[row_move][col_move] == blank) {
      board[row_move][col_move] = moves[current_player];
      displayBoard(board);
      if (isWinningMove(board, moves[current_player])) {
        printf("Congratulations, you win");
        break;
      } else {
        current_player ^= 1;    
      }
    } else {
      printf("Sorry, that space is already taken\n");
      continue;
    }
  }
  return 0;
}
