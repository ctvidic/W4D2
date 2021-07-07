require_relative 'piece'

class Pawn

    MOVES = [
        [0, 1],
        [0, -1]
    ].freeze

    def symbol
        '♙'.colorize(color)
    end

    def moves
        MOVES
    end

    private

    def at_start_row?
        return true if @color == :W && pos.first == 6
        return true if @color == :B && pos.first == 1
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
        if @board[pos.first + forward_dir, pos.last - 1] || @board[pos.first + forward_dir, pos.last + 1]
    end
end