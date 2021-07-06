class Piece

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


module Slideable
    HORIZONTAL_DIRS = [
        [0, 1]
        [0, -1]
        [1, 0]
        [-1, 0]
    ]

    DIAGONAL_DIRS = [
        [1, 1]
        [1, -1]
        [-1, 1]
        [-1, -1]
    ]

    def horizontal_dirs
        HORIZONTAL_DIRS 
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        possible_moves = []
        @board.length.times do 
            self.move_dirs.each do |dirs|
                new_pos = @pos += dirs
                possible_moves << new_pos if new_pos.each {|coord| coord.between(0, 7)}
            end
        end
        possible_moves
    end

    private

    def move_dirs
        case self.symbol
        when :Queen
            horizontal_dirs + diagonal_dirs
        when :Bishop
            diagonal_dirs
        when :Rook
            horizontal_dirs
        end
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        
    end
end

module Stepable

end