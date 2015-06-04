loop do
  puts "Enter a number in binary form"

  input = gets.chomp
  if input == 'q'
    puts "Goodbye"
    break;
  else
    original_num = input.to_i
    decimal_num = 0
    base = 1
    while original_num > 0
      rem = original_num % 10
      decimal_num = decimal_num + rem * base
      base = base * 2
      original_num = original_num / 10
    end
    puts "Your number in decimal form is #{decimal_num}"
  end
end
