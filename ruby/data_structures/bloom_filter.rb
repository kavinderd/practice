class BloomFilter
  
  def initialize(size)
    @filterSize = size
    @filter = Array.new(@filterSize) { |index| 0 }
  end

  def add_hash(str)
    count = 0
    str.to_s.each_byte do |j|
      count += j
    end
    count % @filterSize
  end

  def xor_hash(str)
    count = 0
    str.to_s.each_byte do |j|
      count ^= j
    end
    count % @filterSize
  end

  def mult_hash(str)
    count = 1
    str.to_s.each_byte do |j|
      count *= j
    end
    count % @filterSize
  end

  def add(str)
    addHashVal = add_hash(str).to_i
    multHashVal = mult_hash(str).to_i
    xorHashVal = xor_hash(str).to_i
    @filter[addHashVal] = 1
    @filter[multHashVal] = 1
    @filter[xorHashVal] = 1
  end

  def check(str)
    addHashVal = add_hash(str).to_i
    multHashVal = mult_hash(str).to_i
    xorHashVal = xor_hash(str).to_i
    if @filter[addHashVal] == 1 && @filter[multHashVal] == 1 && @filter[xorHashVal] == 1
      true
    else
      false
    end
  end
end

bf = BloomFilter.new(20)
["ruby", "java", "c", "python", "scheme", "erlang", "c#"].each do |lang|
  bf.add lang
end

["ruby", "jave", "b", "pylon", "scheme", "elixir", "c#"].each do |lang|
  puts "Is #{lang} in filter: #{bf.check(lang)}"
end
