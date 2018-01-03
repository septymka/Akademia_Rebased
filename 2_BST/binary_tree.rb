require 'bundler'

Bundler.require(:default)

class BinaryTree
  attr_reader :left
  attr_reader :right
  attr_reader :value

  def initialize(left, right, value)
    @left = left
    @right = right
    @value = value.to_s
  end

  def self.create(array)
    array.sort!  
    if array.length/2-1 < 0
      node = BinaryTree.new(nil, nil, array[array.length/2])
      return node
    end
    array_left = array[0..array.length/2-1]
    array_right = array[array.length/2+1..array.length-1]
    left_value = create(array_left)
    right_value = create(array_right)
    node = BinaryTree.new(left_value, right_value, array[array.length/2])
  end

  def generate_graph_tree
    graph = GraphViz.new(:G, type: :graph)
    generate_graph_subtree(graph)
    graph
  end

  def generate_graph_subtree(graph)
    this_node = graph.add_nodes(value)
    if left
      left_node = left.generate_graph_subtree(graph)
      graph.add_edges(this_node, left_node)
    end
    if right
      right_node = right.generate_graph_subtree(graph)
      graph.add_edges(this_node, right_node)
    end
    this_node
  end

  def print_tree(file)
    generate_graph_tree.output(png: file)
  end
end