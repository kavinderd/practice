loop do
  puts "Enter number to reverse"
  input = gets.chomp

  if input == 'q'
    puts "Goodbye"
    break
  else
    original = input.to_i
    result = 0
    while original > 0
      rem = original % 10
      result = result * 10 + rem
      original /= 10
    end
    puts "Reversed: #{result}"
  end
end
