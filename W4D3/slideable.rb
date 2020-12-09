# You should make modules for Slideable and Stepable. The Slideable module can implement #moves, but it needs to know what directions a piece can move in (diagonal, horizontally/vertically, both). Classes that include the module Slideable (Bishop/Rook/Queen) will need to implement a method #move_dirs, which #moves will use.

module Slideable 
    HORIZONTAL_VERTICAL_DIRS = [
      [0,1],
      [0,-1],
      [1,0],
      [-1,0]
    ]
    DIAGONAL_DIRS = [
      [1,1]
      [-1,-1]
      [1,-1]
      [-1,1]
    ]

  

    def horizontal_Vertical_dirs
        HORIZONTAL_VERTICAL_DIRS
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    
    def moves
        arr = []
        HORIZONTAL_DIRS.each do |m|
            arr += grow_unblocked_moves_in_dir(m[0], m[1])
        end
        DIAGONAL_DIRS.each do |m|
            arr += grow_unblocked_moves_in_dir(m[0], m[1])
        end
        arr
    end

    private

    def move_dirs
        
    end

    def grow_unblocked_moves_in_dir(dx,dy)
        arr = []
        current_pos = @pos
        x, y = current_pos
        while   valid_pos?[(dx + x), (dy + y)]
            arr << [(dx + x), (dy + y)]
            x += dx
            y += dy
        end
        arr
    end

end