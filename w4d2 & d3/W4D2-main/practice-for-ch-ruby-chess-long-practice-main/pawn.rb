require_relative "piece.rb"
class Pawn < Piece
    def symbol
        '♙'.colorize(color)
    end

    def at_start_row?
        if self.color == :black && self.pos[0] == 1
            return true
        elsif self.color == :white && self.pos[0] == 6
            return true
        end
        return false
    end

    def moves
        moves_arr = []

        moves_arr += forward_steps + side_attacks

    end

    def forward_dir
        if self.color == :black
            return 1
        else
            return -1
        end
    end

    def forward_steps
        moves_arr = []
        pos = self.pos

        if at_start_row?
            if self.color == :black 
                step1 = [pos[0] + 1, pos[1]]
                step2 = [pos[0] + 2, pos[1]]
                moves_arr << step1 if self.board.valid_idx?(step1)
                moves_arr << step2 if self.board.valid_idx?(step2)
            elsif self.color == :white
                step1 = [pos[0] - 1, pos[1]]
                step2 = [pos[0] - 2, pos[1]]
                moves_arr << step1 if self.board.valid_idx?(step1)
                moves_arr << step2 if self.board.valid_idx?(step2)
            end
        else
            if self.color == :black
                step1 = [pos[0] + 1, pos[1]]
                moves_arr << step1 if self.board.valid_idx?(step1)
            elsif self.color == :white
                step1 = [pos[0] - 1, pos[1]]
                moves_arr << step1 if self.board.valid_idx?(step1)
            end
        end
        moves_arr
    end

    def side_attacks
        moves_arr = []
        pos = self.pos

        if self.color == :black
            step1 = [pos[0] + 1, pos[1] + 1]
            step2 = [pos[0] + 1, pos[1] - 1]

            moves_arr << step1 if self.board.valid_idx?(step1) && self.board[step1].color == :white
            moves_arr << step2 if self.board.valid_idx?(step2) && self.board[step2].color == :white
        elsif self.color == :white
            step1 = [pos[0] - 1, pos[1] + 1]
            step2 = [pos[0] - 1, pos[1] - 1]
            moves_arr << step1 if self.board.valid_idx?(step1) && self.board[step1].color == :black
            moves_arr << step2 if self.board.valid_idx?(step2) && self.board[step2].color == :black
        end
        moves_arr
    end
    

end