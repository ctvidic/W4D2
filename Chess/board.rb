
require_relative "piece"

class Board
    attr_reader :rows
    def initialize
        newArr = [0,1,7,6]
        @grid = Array.new(8){Array.new(8)}
        @grid.each_with_index do |row,i|
            if newArr.include?(i)
               row.map!{|val| val = "x"}
            else
               row.map!{|val| val = nil}
            end
        end
    end

    def [](pos)
        row,col = pos
        @grid[row][col]
    end

    def []=(pos,val)
        row,col = pos
        @grid[row][col] = val
    end

    def move_piece(start_pos, end_pos)
        if self[start_pos].nil? 
            raise "No piece at Start Position"
        elsif !self[end_pos].nil? 
            raise "Piece cannot move there"
        else
            piece = self[start_pos]
            self[end_pos] = piece
            self[start_pos] = nil
        end
    end
end

# b=Board.new
# b.move_piece([1,1],[2,2])
# @rows[start_pos[0]][start_pos[1]
# !@rows[end_pos[0]][end_pos[1]]
