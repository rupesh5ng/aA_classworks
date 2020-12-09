require_relative "Piece.rb"
require_relative "slideable.rb"

class Queen
    include slidable
    def symbol

    end
    
    def move_dirs
        horizontal_and_vertical_dirs
        diagonal_dirs
    end
        
    
end