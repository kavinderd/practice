require 'pry-byebug'
def partition(array, left, right, pivot)
  loop do
    while left <= right && array[left] < pivot
      left += 1
    end

    while left <= right && array[right] > pivot
      right -= 1
    end

    if left >= right
      break
    end
    array[left], array[right] = array[right], array[left]
  end
  left
end

def rank(array, left, right, rank)
  pivot = array[rand(left..right)]
  left_end = partition(array, left, right, pivot)

  left_size = left_end - left + 1
  if left_size == rank + 1
    left_end
  elsif rank < left_size
    rank(array, left, left_end, rank)
  else
    rank(array, left_end + 1, right, rank - left_size)
  end
end

array = [12, 55,3, 7, 31, 2, 15, 19, 24, 67, 34, 17, 200, 152, 52, 40, 41, 47, 33, 37]
left = rank(array, 0, array.size - 1, 10)
p array[0...left]
