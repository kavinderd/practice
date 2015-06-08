# Stupid Prime Calculator

puts "Enter a number to determine its primality"
input =gets.chomp.to_i
is_prime = true

start_time = Time.now
2.upto(input) do |i|
  if input % i == 0
    is_prime = false
    break
  end  
end
end_time = Time.now

puts "Prime?: #{is_prime}"
puts "Time: #{end_time- start_time}"

# Smarter Prime Calculator
sqrt = Math.sqrt(input)
is_prime = true
start_time = Time.now
2.upto(sqrt) do |i|
  if input % i == 0
    is_prime = false
    break
  end
end
end_time = Time.now

puts "Prime?: #{is_prime}"
puts "Time: #{end_time- start_time}"

#Sieve of Erasthones Prime Calculator

primes = [true] * (input + 1)
primes[0] = false
primes[1] = false
start_time = Time.now
2.upto(sqrt) do |i|
  if primes[i]
    ((i*i)..(input)).step(i) do |j|
      primes[j] = false
    end
  end
end
end_time = Time.now

puts "Prime?: #{primes[input]}"
puts "Time: #{end_time- start_time}"


