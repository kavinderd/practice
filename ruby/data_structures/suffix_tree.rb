# SuffixTree

class Node

  attr_reader :value, :indexes, :children
  def initialize
    @children = {}
    @indexes = []
  end

  def insert_string(string, index)
    indexes << index
    if string != nil && string.length > 0
      value = string[0]
      node = nil
      if children[value]
        child = children[value]
      else
        child = Node.new
        children[value] = child
      end
      remainder = string[1..-1]
      child.insert_string(remainder, index)
    end
  end

  def search(string)
    unless string && string.length > 0
      indexes
    else
      first = string[0]
      if children[first]
        remainder = string[1..-1]
        children[first].search(remainder)
      end
    end
  end
end
class SuffixTree

  attr_reader :root
  def initialize(string)
    @root = Node.new
    0.upto(string.length - 1) do |i| 
      suffix = string[i..-1]
      @root.insert_string(suffix, i)
    end
  end

  def search(string)
    root.search(string)
  end
end

string = "words"
tree = SuffixTree.new(string)
p tree.search("ds")
p tree.search("ords")
p tree.search("ods")
