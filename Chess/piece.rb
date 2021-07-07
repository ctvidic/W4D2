

class Piece
    attr_accessor :pos

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def to_s 
        return '♙' if self.symbol == '♙'
        return '♛' if self.symbol == '♛'
        return '♚' if self.symbol == '♚'
        return '♜' if self.symbol == '♜'
        return '♝' if self.symbol == '♝'
        return '♞' if self.symbol == '♞'
        return "_" if self.symbol == "_"
    end

    # def []=(pos,val)
    #     row,col = pos
    #     @grid[row][col] = val
    # end

    def [](pos)
        row,col = pos
        @board[row][col]
    end

    def empty?
        self.symbol == "_" ? true : false
    end

    def valid_moves
        
    end

    # def pos=(val)
    #     @board[][] = val 
    # end

    
end



