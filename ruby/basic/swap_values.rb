loop do
  puts "Enter two digits"
  input = gets.chomp

  if input == "q"
    puts "Goodbye"
    break;
  else
    num1, num2 = input.split(" ").map { |char| char.to_i }
    num1, num2 = num2, num1
    puts "Your numbers swapped: #{num1} #{num2}"
  end
end
