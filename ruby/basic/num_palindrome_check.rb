loop do
  puts "Enter a Number or (q)uit:"
  input = gets.chomp
  break if input == 'q'

  original = input.to_i
  num = original
  reverse = 0
  while num > 0
    tmp = num % 10
    num = (num - tmp)/10
    reverse = reverse * 10 + tmp
  end
  if reverse == original
    puts "Num is palindrome"
  else
    puts "Num is not palindrome"
  end
end
