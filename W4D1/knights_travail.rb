
require_relative "00_tree_node.rb"

class KnightPathFinder
    MOVES = [
        [2,1],
        [2,-1],
        [-2,1],
        [-2,-1],
        [1,2],
        [1,-2],
        [-1,2],
        [-1,-2]
    ]

    def self.valid_moves(pos)
        arr = []
        cx, cy = pos #current
        MOVES.each do |nx, ny| #next
            px, py = [(cx + nx),(cy + ny)] #possible
            if px >= 0 && px <= 7 && py >= 0 && py <= 7
                arr << [px, py]
            end
        end
        arr
    end

    attr_accessor :considered_positions, :root_node

    def initialize(starting_pos)
        @starting_pos = starting_pos
        @considered_positions = [starting_pos]
        @root_node = PolyTreeNode.new(@starting_pos)
        build_move_tree
    end
    
    def find_path(end_pos)
        end_node = @root_node.dfs(end_pos)
        arr = trace_path_back(end_node)
        new_arr = arr.map { |node| node.value }
        new_arr.reverse
    end
    
    def trace_path_back(end_node)
        arr_nodes = [] 

        current_node = end_node
        until current_node == nil
            arr_nodes << current_node
            current_node = current_node.parent
        end

        arr_nodes
    end
    
    def new_move_positions(pos)
        arr = []
        KnightPathFinder.valid_moves(pos).each do |position|
            if !@considered_positions.include?(position)
                @considered_positions << position
                arr << position
            end
        end
        arr
    end

    def build_move_tree

        queue = [@root_node]
    
        until queue.empty?

            new_move_positions(queue[0].value).each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                queue << next_node
                queue[0].add_child(next_node)
            end
            queue.shift
        end

    end
end


kpf = KnightPathFinder.new([0, 0])
p kpf.find_path([7, 6]) # => [[0, 0], [1, 2], [2, 4], [3, 6], [5, 5], [7, 6]]
p kpf.find_path([6, 2]) # => [[0, 0], [1, 2], [2, 0], [4, 1], [6, 2]]


