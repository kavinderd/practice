# Mergesort

def mergesort(array)
  return array if array.length == 1
  mid = (array.length - 1)/ 2
  left = mergesort(array[0..mid])
  right = mergesort(array[mid+1..-1])
  merge(left, right)
end

def merge(array1, array2)
  i = 0
  j = 0
  result = []
  while i < array1.length && j < array2.length
    if array1[i] < array2[j]
      result << array1[i]
      i += 1
    else
      result << array2[j]
      j += 1
    end
  end

  while i < array1.length
    result << array1[i]
    i += 1
  end

  while j < array2.length
    result << array2[j]
    j += 1
  end
  result
end

a = [45,213,1,56,3,8,9,167,4]
p mergesort(a)
