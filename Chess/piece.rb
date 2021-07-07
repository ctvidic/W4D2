

class Piece
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s 
        return "P" if self.symbol == :Pawn
        return "Q" if self.symbol == :Queen
        return "K" if self.symbol == :King
        return "R" if self.symbol == :Rook
        return "B" if self.symbol == :Bishop
        return "Kn" if self.symbol == :Knight
        return " " if self.symbol == :Null
    end

    def empty?
        self.symbol == :Null ? true : false
    end

    def valid_moves
        
    end

    def pos=(val)

    end

    
end



module Stepable

end