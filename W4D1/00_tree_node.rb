class PolyTreeNode

  attr_reader :parent, :children, :value

  def initialize(value, children = [])
    @value = value
    @parent = nil
    @children = children
  end

  def parent=(node)
    if self.parent
      self.parent.children.delete(self)
    end
    
    @parent = node

    if self.parent
      self.parent.children << self
    end
  end

  def add_child(child_node)
    child_node.parent = self 
  end

  def remove_child(child_node)
    raise "Error" if !self.children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value = nil)
    return self if self.value == target_value

    self.children.each do |child_node|
      result = child_node.dfs(target_value)
      if result != nil
        return result
      end
    end

    nil
  end

  def bfs(target_value = nil)
    return self if self.value == target_value

    queue = [self]

    until queue.empty?
      queue[0].children.each do |child_node|
        if child_node.value == target_value
          return child_node
        end
  
        queue << child_node
      end

      queue.shift
    end
    nil
  end
end


#         @a
#     @b      @c
#   @d  @e  @f  @g
# find "f"
#   [a, c, f]




# [a, [b, [d, e], c, [f, g]]]
# [a, b, c]
# [b, c]
# [b, c, d, e]
# [c, d, e]
# [c, d, e, f, g]
# [d, e, f, g]
# [e, f, g]
# [f, g]
# [g]


# @f = PolyTreeNode.new("f")
# @g = PolyTreeNode.new("e")
# @d = PolyTreeNode.new("d")
# @e = PolyTreeNode.new("e")
# @b = PolyTreeNode.new("b", [@d, @e])
# @c = PolyTreeNode.new("c", [@f, @g])
# @a = PolyTreeNode.new("a", [@b, @c])


