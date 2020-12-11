# def tower_of_hanoi(n)
#     towers = Array.new(3) {Array.new}
#     tower[0] = [*1..n].reverse
#     render
# end

# def move(x, y)
#     if valid_move?(x, y)
#         move
#     else
#         p ''
#         x, y = gets.chomp.split
#         move(x,y)
#     end
# end

# def valid_move?(x, y)
#     from = x
#     to = y
#     if x.between?(0, 2) && y.between?(0, 2)
#         if arr[x].last < arr[y].last
#             true
#         end
#     end
#     false
# end

# def render
#     towers.each {|tower| p tower}
    

# end

# def won?
#     if (arr[0].empty? && arr[1].empty?) || 
#         (arr[0].empty? && arr[2].empty?)
#         true
#     end
#     false
# end
require 'byebug'

class TowerOfHanoi 

    def initialize(n=3)
        @towers = Array.new(3) {Array.new} #[[5,4,3,2,1],[],[]]
        @towers[0] = [*1..n].reverse
        @length = n
        render
    end

    def render 
        @towers.each {|tower| p tower.join(" ")}
    end

    def move(from, to)
        if valid_move?(from, to)
            @towers[to].push(@towers[from].pop)
        else
            p " Invalid move try again : valid moves are 0,1,2"
            # from, to = gets.chomp.split.map {|el| el.to_i}
            # #from = gets.chomp.to_i
            # #to = gets.chomp.to_i
            # move(from, to)
        end

        render
    end

    def valid_move?(from, to)
        # debugger
        if from.between?(0, 2) && to.between?(0, 2)
            if !@towers[from].empty? && (@towers[to].empty? || @towers[from].last < @towers[to].last)
                true
            else
                false
            end
        end
    end

    def won?
        @towers[0].empty? && @towers[1..2].any? {|tower| tower.empty?}
    end

    def run
        render
        move_count = 0
        until won?
            p 'please enter move'
            from ,to = gets.chomp.split.map {|el| el.to_i}
            move(from, to)
            move_count += 1
        end
        p "Congratulations, you have won in #{move_count} moves!"
    end
end

    
game = TowerOfHanoi.new(3)
game.run