def shortest_palindrome(s)
  return s if s.length <= 1
  a = s + "*" + s.reverse
  cont = [0]
  1.upto(a.length - 1) do |i|
    index = cont[i-1]
    while index > 0 && a[index] != a[i]
      index = cont[index-1]
    end
    index = a[index] == a[i] ? index + 1 : index
    cont.push(index)
  end
  s[cont[-1]..-1].reverse + s
end

string ="abbbaaa"

p shortest_palindrome(string)
