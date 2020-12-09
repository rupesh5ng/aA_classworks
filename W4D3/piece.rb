#To start off, you'll want to create an empty Piece class as a placeholder for now. 
# Write code for #initialize so we can setup the board with instances of Piece in locations
#  where a Queen/Rook/Knight/ etc. will start and nil where the NullPiece will start.
require "singleton"
class Piece

  def initialize(color, board, pos=[])
      @color =color
      @board = Board.new()
      @pos = pos
        
  end
  #  A key method of Piece is #moves, which should return an array of places a Piece can move to. Of course, every piece will move differently, so you can't write (implement) the #moves method of Piece without subclasses.
  
  def valid_moves

  end

  def to_s #turn the value of the piece to a string
    self.symbol.to_s
  end 

  def empty?
    @board[pos].symbol == nil
  end

  def pos=(val)
    @board[@pos] = val
  end
   
  def symbol
  end

  def move_into_check?(end_pos)

  end
end


class NullPiece < Piece
  include Singleton 
  attr_reader :color, :symbol
  def initialize
    super
  end
end


# Phase II: Pieces
# Lets populate the Piece parent class that contains the functionality common to all pieces.


# NB You will not implement tricky moves like "en passant". Don't implement castling, draws, or pawn promotion either. You will handle check and check mate, however.



# Your Piece will need to (1) track its position and (2) hold a reference to the Board. Classes that include Slideable in particular need the Board so they know to stop sliding when blocked by another piece. Don't allow a piece to move into a square already occupied by the same color piece, or to move a sliding piece past a piece that blocks it.

# The NullPiece class should include the singleton module. It will not need a reference to the Board - in fact its initialize method should take no arguments. Make sure you have a way to read its color and symbol.

# Lastly, make your Pawn class. Be sure to use the Chess UML Diagram to guide you on what methods and instance variables to define for this class!

# After completing each piece load the file in pry and make sure it moves properly. Once you have completed all pieces refactor your Board#initialize so that all your pieces are placed in their respective starting positions. If you haven't already, it may good be a good time to go back and refactor Board#move_piece so that it can handle piece colors.

# Time to test! Open up pry and load 'board.rb'. Create an instance of Board and check out different positions with board[pos]. Do you get back instances of the type of pieces you expect? Can you move the pieces around?

