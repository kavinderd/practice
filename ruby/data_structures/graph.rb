# Graph Implementation

class Vertex
  attr_accessor :data, :visited, :processed, :discovered
  def initialize(data)
    @data = data
    @visited = false
    @processed = false
    @discovered = false
  end
end

class EdgeNode
  attr_accessor :to, :next
  def initialize(to, nxt)
    @to = to
    @next = nxt
  end
end

class Graph
  MAX_VERTICES =1000

  attr_reader :count
  def initialize(directed=false)
    @directed = directed
    @degrees= [0] * MAX_VERTICES
    @edges = [nil] * MAX_VERTICES
    @vertices = []
  end


  def insert_edge(from, to, directed=false)
    @vertices[from] = Vertex.new(from) unless @edges[from]
    edge = EdgeNode.new(to, @edges[from])
    @edges[x] = edge
    @degrees[from] += 1
    if directed
      @edge_count += 1
    else
      insert_edge(to, from, true)
    end
  end

  def print_graph
    1.upto(@vertices.length - 1) do |i|
      p = @edges[i]
      while p
        print" #{p.to}"
        p = p.next
      end
      print "\n"
    end
  end

  def prepare_bfs
    @processed = []
    @discovered = []
    @parent = []
    1.upto(@vertices.length - 1) do |i|
      vert = @vertices[i]
      vert.processed = vert.visited = vert.discovered = false
      @parent[i] = -1
    end
  end

  def bfs(from)
    queue = []
    queue.unshift(from)
    @discovered[from] = true
    while queue.any?
      vertex = @vertices[queue.shift]
      vertex.processed = true
      path = @edges[vertex.data]
      while path
        to_vert = @vertices[path.to]
        if !to_vert.processed || @directed
          process_edge(vertex, to_vert)
        end
        unless to_vert.discovered
          queue.push(to_vert)
          to_vert.discovered = true
          @parent[to_vert] = v
        end
        path = path.next
      end
    end
  end

  def find_path(from, to)
    if(from==to || last == -1)
      puts "first: #{first}"
    else
      find_path(first, @parent[last])
      puts "then: #{last}"
    end
  end

  def prepare_dfs
    @entry_time = []
    @time= 0
    @exit_time = []
    @finished = false
    1.upto(@vertices.length - 1) do |i|
      vert = @vertices[i]
      vert.processed = vert.visited = vert.discovered = false
    end
  end

  def dfs(from)
    return if @finished
    @discovered[from] = true
    @time += 1
    @entry_time[from] = @time
    path = g.edges[from]
    while path
      to_vert = @vertices[path.to]
      if !to.vert.discovered
        @parent[to_vert.data] = from
        dfs(to_vert.data)
      elsif (!to_vert.processed && @parent[from] != to_vert.data) || @directed
        #process edge
      end
      p = p.next
    end
    @time += 1
    @exit_time[from.data] = @time
    from.processed = true
  end

end
