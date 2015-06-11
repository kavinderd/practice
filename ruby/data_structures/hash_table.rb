# HashTable implementation

module Dictionary
  class Item
    attr_reader :value
    attr_accessor :next, :key
    def initialize(value)
      @value = value
    end
  end

  class LinkedList
  end

  class HashTable

    HASHING_STRATEGIES = [:linear_probing, :double_hashing, :seperate_chaining]
    attr_reader :size, :strategy
    def initialize(size, hashing_strategy=:linear_probing)
      if HASHING_STRATEGIES.include?(hashing_strategy)
        @strategy= hashing_strategy
        @size = size
        if @strategy == :seperate_chaining
          @bucket = Array.new(size, LinkedList.new)
        else
          @bucket = Array.new(size)
        end
      else
        raise "Invalid Hashing Strategy"
      end
    end

    def insert(key, value)
      send("#{strategy}_insert", key, value)
    end

    private

    def linear_probing_insert(key, value)
      hashed_key = hash(key)
      item = Item.new(value)
      while @bucket[key] && key < @size
        key += 1
        key  = hash(key)
      end
      item.key = key
      @bucket[key] = item
    end

    def linear_probing_find(key)
      key = hash(key)
      while @bucket[key] && key < size
        if @bucket[key].key == value
          return @bucket[key]
        end
        key += 1
        key = hash(key)
      end
    end

    def hash(key)
      key % size
    end
  end
end
