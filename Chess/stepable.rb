module Stepable
    def moves
        all_moves = []
        move_diffs.each do |diff|
            new_pos = [pos.first + diff.first, pos.last + diff.last] 
            if @board[new_pos] == NullPiece.instance
                all_moves << new_pos if new_pos.each {|coord| coord.between(0, 7)}
            elsif @board[new_pos] == Piece.instance && @board[new_pos] != NullPiece.instance
                if @board[new_pos].color != self.color
                    possible_moves << new_pos if new_pos.each {|coord| coord.between(0, 7)}
                    break
                else
                    break
                end
            end
        end
        all_moves
    end
    
    protected
    
    def move_diffs
        raise NotImplementedError "Make a move dirs method in your piece subclass!!"
    end
end
