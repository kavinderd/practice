def max_duffel_bag_value(cakes, capacity)
  cache = Hash.new { Hash.new }
  max = fill_from_to_capacity(cakes, 0, capacity, cache)
end

def fill_from_to_capacity(cakes, from, capacity, cache)
  return 0 if from == cakes.count
  max = 0
  from.upto(cakes.count - 1) do |i|
    taken_amount =0
    taken_value = 0
    cake = cakes[i]
    next if cake[0] == 0
    until taken_amount * cake[0] > capacity
      taken_value = taken_amount * cake[1]
      taken_weight = taken_amount * cake[0]
      if cache[i][taken_amount]
        taken_value = cache[i][taken_amount]
      else
        taken_value += fill_from_to_capacity(cakes, i+1, capacity - taken_weight, cache)
        cache[i][taken_amount] = taken_value
      end
      taken_amount += 1
      max = [taken_value, max].max
    end
  end
  max
end

cakes = [[7, 160], [0, 0], [2, 15]]
max = max_duffel_bag_value(cakes, 20)
p max
