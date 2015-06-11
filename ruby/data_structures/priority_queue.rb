module PriorityQueue

  class Heap

    class Node
      attr_accessor :value

      def initialize(value)
        @value = value
      end
    end

    attr_reader :size
    def initialize
      @size = 0
      @heap = []
    end

    def insert(key)
      node = Node.new(key)
      @heap[@size] = node
      trickle_up(@size)
      @size += 1
    end

    def remove
      root = @heap[0]
      @size -= 1
      @heap[0] = @heap[@size]
      trickle_down(0)
      root
    end

    private

    def trickle_up(index)
      parent = (index - 1)/2
      bottom = @heap[index]
      # Inver @heap[parent].value > bottom.value to have a Max Heap
      while index > 0 && @heap[parent] && @heap[parent].value > bottom.value
        @heap[index] = @heap[parent]
        index = parent
        parent = (parent - 1)/2
      end
      @heap[index] = bottom
    end

    def trickle_down(index)
      top = @heap[index]
      while index < @size / 2
        left_child = 2 * index + 1
        right_child = left_child + 1
        if right_child < @size && @heap[left_child].value < @heap[right_child].value
          larger_child = right_child
        else
          larger_child = left_child
        end

        if top.value >= @heap[larger_child].value
          break
        end
        @heap[index] = @heap[larger_child]
        index = larger_child
      end
      @heap[index] = top
    end
  end


  class SortedArray

    def initialize
      @array = []
    end

    def insert(value)
      @array.unshift(value)
      sort unless @array.size == 1
    end

    def remove
      @array.shift
    end

    private

    def sort
      i = 0
      j = i + 1
      while @array[i] && @array[j] && @array[i] > @array[j]
        @array[i], @array[j] = @array[j], @array[i]
        i = j
        j += 1
      end
    end
  end

  class BoundedHeight

    attr_reader :size
    def initialize(size=10)
      puts "Allowed keys 0..#{size-1}"
      @buckets = Array.new(size)
      @top = size - 1
    end

    def insert(key, value)
      @buckets[key] = [] unless @buckets[key]
      @buckets[key].push(value)
      @top = [@top, key].min
    end

    def remove
      removed = @buckets[@top].shift
      @top += 1if @buckets[@top].empty?
      removed
    end

  end

  class BinarySearchTree

    class Node
      attr_reader :value
      attr_accessor :right, :left
      def initialize(value)
        @value = value
      end
    end

    def initialize
    end

    def insert(value)
      node = Node.new(value)
      if @root
        current = @root
        previous = current
        while current
          previous = current
          if node.value > current.value
            current = current.right
          else
            current = current.left
          end
        end
        node.value < previous.value ? previous.left = node : previous.right = node
      else
        @root = node
      end
    end

    def remove_min
      current = @root
      previous = current
      while current.left
        previous = current
        current =current.left
      end
      previous.left =nil
      return current
    end
  end
end

heap_pq = PriorityQueue::Heap.new
heap_pq.insert(5)
heap_pq.insert(10)
heap_pq.insert(12)
heap_pq.insert(3)
node = heap_pq.remove
if node.value == 3
  puts "PriorityQueue::Heap Operational"
else
  raise "PriortyQueue::Heap Error: Node returnerd #{node.value}"
end

sorted_array_pq = PriorityQueue::SortedArray.new
sorted_array_pq.insert(5)
sorted_array_pq.insert(10)
sorted_array_pq.insert(12)
sorted_array_pq.insert(3)
val = sorted_array_pq.remove
if val == 3
  puts "PriorityQueue::SortedArray Operational"
else
  raise "PriorityQueue::SortedArray Error: Value returned #{val}"
end

bounded_height_pq = PriorityQueue::BoundedHeight.new
bounded_height_pq.insert(5, "a")
bounded_height_pq.insert(10, "b")
bounded_height_pq.insert(12, "c")
bounded_height_pq.insert(3, "d")
val = bounded_height_pq.remove
if val == "d"
  puts "PriorityQueue::BoundedHeight Operational"
else
  raise "PriorityQueue::BoundedHeight Error: Value returned #{val}"
end

bst_pq = PriorityQueue::BinarySearchTree.new
bst_pq.insert(5)
bst_pq.insert(10)
bst_pq.insert(12)
bst_pq.insert(3)
node = bst_pq.remove_min
if node.value == 3
  puts "PriorityQueue::BinarySearchTree Operational"
else
  raise "PriorityQueue::BoundedHeight Error: Value returned #{node.value}"
end

