require "byebug"

class PolyTreeNode
    attr_reader :value, :parent, :children
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

    #  debugger
    # check the root, if it is equal to value return it
    # call dfs on the children of root 
    # return nil if not found
    def dfs(target)
        # debugger
        return nil if self.value.nil?
        return self if target == self.value
        self.children.each do |child|
            search_result = child.dfs(target)
            return search_result unless child.nil?
        end
        nil
    end

    def bfs(target)
        return self.value if self.value == target
        self.children.each do |node|
            return node if node.value == target
        end
        nil
    end

    
end
