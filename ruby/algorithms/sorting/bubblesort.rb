# BubbleSort

def bubble_sort(array)
  length = array.length - 1
  loop do
    swapped = false
    length.times do |i|
      if array[i] > array[i + 1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end
    break unless swapped
  end
  array
end
a = [15, 2, 4, 1, 6, 9, 8]
p bubble_sort(a)
