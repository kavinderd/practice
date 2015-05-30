number = ARGV[0].to_i
puts "You entered #{number}"
if((number & 1) == 1)
  puts "Odd"
else
  puts "Even"
end
