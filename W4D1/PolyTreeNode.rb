class PolyTreeNode
    attr_reader :parent, :children
    attr_accessor :value
    def initialize(value)
        @value = value
        @parent = nil
        # @old_parent = nil
        @children = []
    end

    #node here is the parent
    def parent=(node)
        # debugger
        if @parent != node && !node.nil?  
            if !@parent.nil?
                @parent.children.delete(self) if !@parent.nil?
                @parent.remove_child(self)
            end 
            @parent = node
            node.children << self
        else
            @parent = nil
        end
    end

    #node here is the child
    def add_child(node)
        node.parent = self
    end

    #node here is the child
    def remove_child(node)
        raise "node is not a child" if node.parent == nil
        node.parent = nil
    end

    def dfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
        
          return self if prc.call(self)
    
        children.each do |child|
          result = child.dfs(&prc)
          return result unless result.nil?
        end
        nil
      end

      def bfs(target = nil, &prc)
        raise "Need a proc or target" if [target, prc].none?
        prc ||= Proc.new { |node| node.value == target }
    
        nodes = [self]
        until nodes.empty?
          node = nodes.shift
    
          return node if prc.call(node)
          nodes.concat(node.children)
        end
        nil
      end
    
      def count
        1 + children.map(&:count).inject(:+)
      end
end