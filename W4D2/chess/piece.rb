#To start off, you'll want to create an empty Piece class as a placeholder for now. 
# Write code for #initialize so we can setup the board with instances of Piece in locations
#  where a Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.
require "singleton"
class Piece

    def initialize(name)
        @name = name
        # @pos = pos
        
    end
    
end


class NullPiece < Piece
  include Singleton 
  attr_reader :name
  def initialize(name = nil)
    super(name)
  end
end