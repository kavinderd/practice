number = ARGV[0].to_i

puts "You entered #{number}"

if number > 0
  puts "Positive"
elsif number < 0
  puts "Negative"
else
  puts "Zero"
end
