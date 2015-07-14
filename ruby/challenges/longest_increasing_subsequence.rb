def ceil_index(array, l, r, key)
  m = 0
  while(r - l > 1)
    m = l + (r - l)/2
    if array[m] >= key
      r = m
    else
      l = m
    end
  end
  r
end

def longest_increasing_subsequence(array, size)
  tail_table = [0] * array.size
  len = 0
  tail_table[0] = array[0]
  len = 1
  1.upto(array.length - 1) do |i|
    p tail_table
    if array[i] < tail_table[0]
      # New overall smallest value
      tail_table[0] = array[i]
    elsif array[i] > tail_table[len - 1]
      # A[i] wants to extend largest subsequence 
      tail_table[len] = array[i]
      len += 1
    else
      # Otherwise extend a previous sequence
      tail_table[ceil_index(tail_table, 0, len-1, array[i])] = array[i]
    end
  end

  len
end

a = [ 2, 5, 3, 7, 11, 8, 10, 13, 6]

p longest_increasing_subsequence(a, a.size)





def find_index_before_current_largest(array, first, last, value)
  mid = 0
  while ( last - first > 1)
    mid = first + (last - first)/ 2
    if array[mid] >= value
      last = mid
    else
      first = mid
    end
  end
  last
end


def longest_increasing_subsequence(array)
  size = array.size
  tail_tables = [0] * size
  tail_tables[0] = array[0]
  len = 1
  (1...size).each do |i|
    if array[i] < tail_tables[0]
      # New Min
      tail_tables[0] = array[i]
    elsif array[i] > tail_tables[len-1]
      # current value is greater than previous high so extend
      tail_tables[len] = array[i]
      len += 1
    else
      index = find_index_before_current_largest(tail_tables, 0, len - 1, array[i])
      tail_tables[index] = array[i]
    end
  end
  len
end






a = [ 2, 5, 3, 7, 11, 8, 10, 13, 6]

p longest_increasing_subsequence(a)





















