module Stepable

    KING_MOVES = [
        [0, -1], 
        [0, 1], 
        [-1, 0],
        [1, 0],
        [-1, 1],
        [-1, -1], 
        [1, 1],
        [1, -1]
    ].freeze

    KNIGHT_MOVES = [
        [-1, 2], 
        [1, 2],
        [-2, 1], 
        [2, 1],
        [-2, -1], 
        [2, -1],
        [-1, -2], 
        [1, -2]
    ].freeze

    def king_moves
        KING_MOVES
    end

    def knight_moves
        KNIGHT_MOVES
    end
    
    def moves

        moves_arr = []
        dirs = move_dirs

        dirs.each do |dir|
            dir_x = dir[0]
            dir_y = dir[1]
            current_pos = [self.pos[0] + dir_x, self.pos[1] + dir_y]

            if self.board.valid_pos?(current_pos)
                moves_arr << current_pos
            elsif self.board.valid_idx?(current_pos)
                if self.board[current_pos].color == self.color
                else
                    moves_arr << current_pos
                end
            end

        end
        return moves_arr

    end

    # private

    def move_dirs
        raise NotImplementedError
    end

end

