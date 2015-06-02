loop do
  puts "Enter two numbers, first larger than second"
  input = gets.chomp
  if input == 'q'
    puts "Goodbye"
    break
  else
    num1, num2 = input.split(" ").map { |char| char.to_i }
    result = ((num2 - num1)/5) + 1

    puts "There are #{result} multiples of 5 in this range"
  end
end
