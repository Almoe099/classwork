require_relative "piece.rb"
require_relative "stepable.rb"

class Knight < Piece
    include Stepable
    def symbol
        '♘'.colorize(color)
    end
    def move_dirs
        knight_moves
     end
end