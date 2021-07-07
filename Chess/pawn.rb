require_relative 'piece'
require "byebug"
class Pawn < Piece

    def symbol
        '♙'.colorize(color)
    end
    
    def moves
        pawn_moves = side_attacks
        pawn_moves << [pos.first+forward_steps, pos.last]
        pawn_moves << [pos.first+forward_dir, pos.last]
        pawn_moves_in_grid = pawn_moves.select{|coord| coord[0].between?(0,7) && coord[1].between?(0,7)}
        legal_moves = pawn_moves_in_grid.select{|coord| @board[coord] == NullPiece.instance || @board[coord].color != self.color }
        legal_moves
    end

    private

    def at_start_row?
        return true if @color == :W && @pos.first == 6
        return true if @color == :B && @pos.first == 1
        false
    end

    def forward_dir
        return -1 if @color == :W
        return 1 if @color == :B
    end

    def forward_steps
        at_start_row? ? forward_dir * 2 : forward_dir
    end

    def side_attacks
        diag1 = @board[pos.first + forward_dir,pos.last - 1]
        diag2 = @board[pos.first + forward_dir, pos.last + 1]
        newArr = []
        if diag1 != NullPiece && diag1.color != self.color
            newArr << [pos.first + forward_dir, pos.last - 1]
        end
        if diag2 != NullPiece && diag2.color != self.color
            newArr << [pos.first + forward_dir, pos.last + 1]
        end
        newArr     
    end
end


# load "board.rb"
# b = Board.new
# p = b.[]([1,1])