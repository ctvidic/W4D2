require_relative "piece"
require "singleton"
require "byebug"
require_relative "pawn"
require_relative "knight"
require_relative "king"
require_relative "queen"
require_relative "nullpiece"
require_relative "bishop"
require_relative "rook"


class Board
    attr_reader :grid
    def initialize
        @grid = Array.new(8){Array.new(8)}
        populate
    end

    def populate
        @grid.each_with_index do |subgrid,row|
            subgrid.each_with_index do |val,col|
                if row == 1
                    @grid[row][col] = Pawn.new(:B,self,[row,col])
                elsif row == 6
                    @grid[row][col] = Pawn.new(:W,self,[row,col])
                elsif row == 0 && (col == 0 || col == 7)
                    @grid[row][col] = Rook.new(:B, self,[row,col])
                elsif row == 7 && (col == 0 || col == 7)
                    @grid[row][col] = Rook.new(:W, self,[row,col])
                elsif row == 0 && (col == 1 || col == 6)
                    @grid[row][col] = Knight.new(:B, self,[row,col])
                elsif row == 7 && (col == 1 || col == 6)
                    @grid[row][col] = Knight.new(:W, self,[row,col])
                elsif row == 0 && (col == 2 || col == 5)
                    @grid[row][col] = Bishop.new(:B, self,[row,col])
                elsif row == 7 && (col == 2 || col == 5)
                    @grid[row][col] = Bishop.new(:W, self,[row,col])
                elsif row == 0 && col == 3
                    @grid[row][col] = Queen.new(:B, self,[row,col])
                elsif row == 0 && col == 4
                    @grid[row][col] = King.new(:B, self,[row,col])
                elsif row == 7 && col == 3
                    @grid[row][col] = Queen.new(:W, self,[row,col])
                elsif row == 7 && col == 4
                    @grid[row][col] = King.new(:W, self,[row,col])
                else
                    @grid[row][col] = NullPiece.instance
                end
            end
        end
    end

    def [](pos)
        row, col = pos
        @grid[row][col]
    end

    def []=(pos,val)
        row, col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos] == NullPiece.instance 
            raise "No piece at Start Position"
        elsif !(self[end_pos] == NullPiece.instance)
            raise "Piece cannot move there"
        else
            piece = self[start_pos]
            self[end_pos] = piece
            self[start_pos] = NullPiece.instance
        end
    end
end

# b=Board.new
# b.move_piece([1,1],[2,2])
# @rows[start_pos[0]][start_pos[1]
# !@rows[end_pos[0]][end_pos[1]]
