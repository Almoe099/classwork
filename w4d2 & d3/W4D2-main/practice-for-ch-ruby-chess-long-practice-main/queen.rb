require_relative "piece.rb"
require_relative "slideable.rb"
require 'colorize'

class Queen < Piece

    include Slideable

    def symbol
        # '♕'
        '♕'.colorize(color) 
    end

    def move_dirs
        return horizontal_and_vertical_dirs + diagonal_dirs
    end

end