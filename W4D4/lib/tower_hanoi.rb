def tower_of_hanoi(n)
    towers = Array.new(3) {Array.new}
    tower[0] = [*1..n].reverse
    render
end

def move(x, y)
    if valid_move?(x, y)
        move
    else
        p ''
        x, y = gets.chomp.split
        move(x,y)
    end
end

def valid_move?(x, y)
    from = x
    to = y
    if x.between?(0, 2) && y.between?(0, 2)
        if arr[x].last < arr[y].last
            true
        end
    end
    false
end

def render
    towers.each {|tower| p tower}
    

end

def won?
    if (arr[0].empty? && arr[1].empty?) || 
        (arr[0].empty? && arr[2].empty?)
        true
    end
    false
end


class TowerOfHanoi 

    def initialize(n=3)
        @towers = Array.new(3) {Array.new} #[[5,4,3,2,1],[],[]]
        @towers[0] = [*1..n].reverse
        render
    end

    def render 
        @towers.each {|tower| p tower.join(" ")}
    end

    def move(from , to)
        if valid_move?(from,to)
            @towers[to].push(@towers[from].pop)
        else
            p " Invalid move try again : valid moves are 0,1,2"
            from,to = gets.chomp.split.map {|el| el.to_i}
            #from = gets.chomp.to_i
            #to = gets.chomp.to_i
            move(from,to)
        end

        render
    end

    


end

