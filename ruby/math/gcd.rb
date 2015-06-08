puts "Enter two numbers:"
a,b = gets.chomp.split(" ").map { |char| char.to_i }

def gcd(a,b)
  if b == 0
    a
  else
    gcd(b, a%b)
  end
end

def lcm(a,b)
  (a*b) / gcd(a,b)
end

puts "GCD = #{gcd(a,b)} LCM = #{lcm(a,b)}"
