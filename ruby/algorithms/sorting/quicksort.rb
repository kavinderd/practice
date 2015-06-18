# QuickSort

def partition(array, left, right, pivot)
  left_ptr = left - 1
  right_ptr = right + 1
  loop do
    loop do 
      left_ptr += 1
      break unless left_ptr < right && array[left_ptr] < pivot
    end

    loop do
      right_ptr -= 1
      break unless right_ptr > left && array[right_ptr] > pivot
    end

    if left_ptr >= right_ptr
      break
    else
      array[left_ptr], array[right_ptr] = array[right_ptr], array[left_ptr]
    end
  end
  left_ptr
end

def quicksort(array, left, right)
  p array[left..right]
  if right - left <= 0
    array
  else
    pivot_index = (left + ((right - left) / 2)).to_i
    pivot = array[pivot_index]
    partition = partition(array, left, right, pivot)
    quicksort(array, left, partition - 1)
    quicksort(array, partition + 1, right)
  end
end

a = [4,16, 45, 5, 89, 1, 74, 2]
quicksort(a, 0, a.size - 1)
p a

