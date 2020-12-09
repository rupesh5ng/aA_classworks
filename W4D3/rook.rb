require_relative "Piece.rb"
require_relative "slideable.rb"
class Rook < Piece

    include Slideable

    def symbol

    end
    
    def move_dirs
        horizontal_and_vertical_dirs
    end
end