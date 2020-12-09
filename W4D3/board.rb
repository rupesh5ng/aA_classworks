# Phase I: Board
# Your Board class should hold a 2-dimensional array (an array of arrays). 
# Each position in the board either holds a moving Piece or a NullPiece 
# (NullPiece will inherit from Piece).
# The Board class should have a #move_piece(start_pos, end_pos) method. This should update the 2D 
# grid and also the moved piece's position. You'll want to raise an exception if:
# there is no piece at start_pos or the piece cannot move to end_pos.
# Time to test! Open up pry and load 'board.rb'. Create an instance of Board and check out different 
# positions with board[pos]. Do you get back Piece instances where you expect to? Test out Board#move_piece(start_pos, end_pos), 
# does it raise an error when there is no piece at the start? Does it successfully update the Board?

# Once you get some of your pieces moving around the board, call over your TA for a code-review.
require_relative "./piece.rb"

class Board

    def initialize
        @grid = Array.new(8) {Array.new(8)}
        @null_piece = NullPiece.instance
    end
    def [](pos)
        i,j = pos
        @grid[i][j]
    end

    def []=(piece, pos)
        i,j = pos
        @grid[i][j] = piece
    end


    def populate
        

    end

    def valid_pos?(pos)
        x, y = pos
        #check to see if in board first
        if x < 0 || x > 7  || y < 0 || y > 7
            return false
        end
        if self[pos].symbol != nil
            return false
        end
        true
    end

    def add_piece(piece, pos)
        if valid_pos?(pos)
            self[pos] = piece
        end
    end
    def move_piece(color,start_pos, end_pos)
        raise "there is no piece at start_pos" if @grid[start_pos] = @null_piece 
        # raise "the piece cannot move to end_pos"     #### we need white and black

        piece = @grid[start_pos]
        @grid[end_pos] = piece
        @grid[start_pos] = @null_piece
    end

    def render 
        (0...@grid.length).each do |idx|
            r = (idx + 1).to_s
            @grid.each do |piece|
                r += "#{piece.value } | "
            end
            puts r 
            puts --------------------------
        end
        puts "A  B  C  D  E  F  G  H"
    end

end



# There are many different kinds of pieces in chess, and each moves a specific way.
#  Based on their moves, they can be placed in four categories:

# Sliding pieces (Bishop/Rook/Queen)
# Stepping pieces (Knight/King)
# Null pieces (occupy the 'empty' spaces)
# Pawns (we'll do this class last)
# 


