# CCI 18.11

class SquareCell
  attr_accessor :zeros_right, :zeros_left
end

class SubSquare
  attr_accessor :row, :col, :square_size
end

def find_square(matrix)
  processed = process_square(matrix)
  square = nil
  (matrix.length - 1).downto(1) do |i|
    square = find_square_with_size(processed, i)
    square = square if square 
  end
  square
end

def find_square_with_size(matrix, square_size)
  count = matrix.length - square_size + 1

  square = nil
  0.upto(count - 1) do |row|
    0.upto(count - 1) do |col|
      if isSquare(matrix, row, col, squareSize)
        ss = SubSquare.new
        ss.row = row
        ss.col = col
        ss.square_size = square_size
        square = ss
        break
      end
    end
  end
  square
end

def is_square?(matrix, row, col, size)
  top_left = matrix[row][col]
  top_right = matrix[row][col + size - 1]
  bottom_left = matrix[row + size - 1][col]
  
  if top_left.zeros_right < size || top_left.zeros_below < size || top_right.zeros_below < size || bottom_left.zeros_right < size
    false
  else
    true
  end
end

def process_square(matrix)
  processed = []
  (matrix.length - 1).downto(0) do |r|
    (matrix.length - 1).downto(0) do |c|
      right_zeros = 0
      below_zeros = 0

      if matrix[r][c] == 0
        right_zeros += 1
        below_zeros += 1

        if c + 1 < matrix.length
          previous = processed[r][c+1]
          right_zeros += previous.zeros_right
        end
        if r + 1 < matrix.length
          previous = processed[r+1][c]
          below_zeros += previous.zeros_below
        end
      end
      sc = SquareCell.new
      sc.zeros_right = right_zeros
      sc.zeros_below = below_zeros
      processed[r][c] = sc
    end
  end
  processed
end
