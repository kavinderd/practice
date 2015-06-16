class MySet

  attr_reader :set
  def initialize(set=[])
    @set = set
  end

  def add(element)
    @set << element unless @set.include?(element)
  end

  def delete(element)
    @set.delete(element)
  end

  def subset?(set)
    return false if set.size < @set.size
    @set.all? { |e| set.include? e }
  end
  
  def superset?(set)
    return false if @set.size < set.size
    set.all? { |e| @set.include? e }
  end

  def union(set)
    s = MySet.new(@set.dup)
    set.each { |e| s.add(e) }
    s
  end

  def include?(elem)
    @set.include?(elem)
  end
  
  
  def disjoint(set)
    s = MySet.new(set)
    @set.each do |elem|
      if s.include?(elem)
        s.delete(elem)
      else
        s.add(elem)
      end
    end
    s
  end
end

s = MySet.new([1,2,3])
s2 = MySet.new([4,1,5])

newset =s.union(s2.set)

set = s.disjoint(s2.set)
p set.set

