# require_relative "./pieces/bishop"
# require_relative "./pieces/king"
# require_relative "./pieces/knight"
# require_relative "./pieces/pawn"
# require_relative "./pieces/queen"
# require_relative "./pieces/rook"


class Piece

    attr_reader :color, :board, :pos
    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
        board.add_piece(self, pos)
    end

    def to_s
        
    end

    def empty?
        # if @symbol == nil
        #     return true
        # else
        #     return false
        # end
    end


    def moves

    end


    def valid_moves


    end

    def pos=(val)
    end

    def symbol
        # :K = Knight.new(nsam)
    end

    def move_into_check?(end_pos)
        
    end

end