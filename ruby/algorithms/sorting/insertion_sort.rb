# Insertion Sort

def insertion_sort(array)
  j = 0
  0.upto(array.length - 1) do |i|
    j = i
    while j > 0 && array[j-1] > array[j]
      array[j], array[j-1] = array[j-1], array[j]
      j -= 1
    end
  end
  array
end

array = [45, 12, 1, 13, 3, 56, 4, 7]
p insertion_sort(array)




