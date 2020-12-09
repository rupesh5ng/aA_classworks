require_relative "Piece.rb"
require_relative "slideable.rb"
class Bishop
    include slideable
    def symbol

    end
    
    def move_dirs
        diagonal_dirs
    end

end