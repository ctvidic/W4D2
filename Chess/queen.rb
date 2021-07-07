require_relative "slideable"
require_relative "piece"

class Queen < Piece
    include Slideable

    def symbol
        '♛'.colorize(color)
    end
    protected
    def move_dirs
        diagonal_dirs + horizontal_dirs
    end
end