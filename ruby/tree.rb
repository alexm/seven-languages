#!/usr/bin/env ruby

class Tree
  attr_accessor :children, :node_name

  def initialize( name, children=[] )
    @node_name = name
    case children.class.to_s
    when "Hash"
      @children = []
      children.each { |k,v| @children << Tree.new(k,v) }
    when "Array"
      @children = children
    else
      raise "unsupported type for children"
    end
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call(self)
  end
end

ruby_tree = Tree.new( "Ruby", [ Tree.new("Reia"), Tree.new("MacRuby") ] )

puts "Visiting a ruby node:"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire ruby tree:"
ruby_tree.visit_all { |node| puts node.node_name }
puts

family_hash = {
  "grandpa" => {
    "dad" => {
      "child 1" => {},
      "child 2" => {},
    },
    "uncle" => {
      "child 3" => {},
      "child 4" => {},
    },
  },
}

family_tree = Tree.new( "Family", family_hash )

puts "Visiting a family node:"
family_tree.visit { |node| puts node.node_name }
puts

puts "Visiting entire family tree:"
family_tree.visit_all { |node| puts node.node_name }
