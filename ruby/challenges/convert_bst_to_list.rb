# Convert a node-like data structure called BiNode, which has pointers to two other nodes.

class BiNode
  attr_accessor :node1, :node2, :data

  def initialize(data)
    @data = data
  end
end
require 'pry-byebug'
LEFT = 0
RIGHT = 1
def convert(node, dir=NIL)
  return nil unless node
  left = convert(node.node1, LEFT)
  if left
    node.node1 = left
    left.node2 = node
  end
  right = convert(node.node2, RIGHT)
  if right
    node.node2 = right
    right.node1 = node
  end
  if dir == LEFT
    node.node2 ? node.node2 : node
  elsif dir == RIGHT
    node.node1 ? node.node1 : node
  else
    cur = node.node1
    while cur.node1
      cur = cur.node1
    end
    cur
  end
end

root = BiNode.new(5)
n1 = BiNode.new(3)
root.node1 = n1
n2 = BiNode.new(4)
n1.node2 = n2
n3 = BiNode.new(1)
n1.node1 = n3

n4 = BiNode.new(7)
root.node2 = n4
n5 = BiNode.new(6)
n4.node1 = n5


node = convert(root)
binding.pry
p node
