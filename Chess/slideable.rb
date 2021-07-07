module Slideable
    HORIZONTAL_DIRS = [
        [0, 1],
        [0, -1],
        [1, 0],
        [-1, 0]
    ].freeze

    DIAGONAL_DIRS = [
        [1, 1],
        [1, -1],
        [-1, 1],
        [-1, -1]
    ].freeze

    def horizontal_dirs
        HORIZONTAL_DIRS 
    end

    def diagonal_dirs
        DIAGONAL_DIRS
    end

    def moves
        all_moves = []
        move_dirs.each do |dir|
            all_moves << grow_unblocked_moves_in_dir(dir.first, dir.last)
        end
        all_moves
    end

    private

    def move_dirs
        raise NotImplementedError "Make a move dirs method in your piece subclass!!" 
    end

    def grow_unblocked_moves_in_dir(dx, dy)  
        possible_moves=[]
        new_pos = pos
        @board.length.times do 
            new_pos = [new_pos.first + dx, new_pos.last + dy]
            if @board[new_pos] == Null_Piece.instance
                possible_moves << new_pos if new_pos.each {|coord| coord.between(0, 7)}
            elsif @board[new_pos] == Piece.instance && @board[new_pos] != Null_Piece.instance
                if @board[new_pos].color != self.color
                    possible_moves << new_pos if new_pos.each {|coord| coord.between(0, 7)}
                    break
                else
                    break
                end
            end
        end
        possible_moves
    end
end