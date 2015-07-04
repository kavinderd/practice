def clear_array(array)
  0.upto(array.length - 1) do |i|
    array[i] = 0
  end
end

def max_submatrix(matrix)
  row_count = matrix.length
  col_count = matrix[0].length
  partial_sum = [0] * col_count
  max_sum = 0
  0.upto(row_count - 1) do |row_start|
    clear_array(partial_sum)
    row_start.upto(row_count - 1) do |row_end|
      0.upto(col_count - 1) do |i|
        partial_sum[i] += matrix[row_end][i]
      end
      tmpmax = max_subarray(partial_sum, col_count)
      max_sum = [max_sum, tmpmax].max
    end
  end
  max_sum
end

def max_subarray(array, n)
  max_sum = 0
  running_sum =0
  0.upto(n-1) do |i|
    running_sum += array[i]
    max_sum = [max_sum, running_sum].max
    running_sum = 0 if running_sum < 0
  end
  max_sum
end

matrix = [[9, -8, 1, 3, -2],
          [-3, 7, 6, -2, 4],
          [6, -4, -4, 8, -7]]

p max_submatrix(matrix)
