require_relative "piece.rb"
require_relative "bishop.rb"
require_relative "king.rb"
require_relative "rook.rb"
require_relative "knight.rb"
require_relative "queen.rb"
require_relative "pawn.rb"
require_relative "null_piece.rb"

require 'colorize'

class Board 

    attr_reader :rows

    def initialize
        @rows = Array.new(8) {Array.new(8)} 
        # @null_piece = NullPiece.new
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def setup_back_row(color, row)
        back_row = [Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook]
        
        back_row.each_with_index do |piece_class, i|
            pos = [row, i]

            piece_class.new(color, self, pos)

        end
    end

    def setup_pawn_row(color, row)

        (0..7).each do |i|
            pos = [row, i]
            Pawn.new(color, self, pos)
        end

    end

    def move_piece(color, start_pos, end_pos)
        if valid_pos?(end_pos)
            piece = self[start_pos] 
            self[end_pos] = piece
            self[start_pos] = nil
        end
    end

    def valid_idx?(pos)
        x, y = pos
        if x >= 0 && x <= 7 && y >= 0 && y <= 7
            return true
        end
        return false
    end


    def valid_pos?(pos)
        x, y = pos
        if x >= 0 && x <= 7 && y >= 0 && y <= 7
            if self[pos].nil?
                return true
            end
        end
        return false
    end

    def setup_board

        (0...@rows.length).each do |x|
            if x == 0
                setup_back_row(:black, x) 
            elsif x == 1
                setup_pawn_row(:black, x)
            elsif x == 6
                setup_pawn_row(:white, x)
            elsif x == 7
                setup_back_row(:white, x)
            else
                setup_null_row(x)
            end
        end

    end

    def setup_null_row(x)
        (0..7).each do |y|
            pos = [x, y]
            self[pos] = NullPiece.instance
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def print_board
        @rows.each do |row|
            row.each do |ele|
                if ele == NullPiece.instance
                    print " "
                else
                    print ele.symbol
                end
            end
            print "\n"
        end
        return nil
    end

    def checkmate?(color)
    end

    def in_check?(color)
    end

    def find_king(color)
    end

    def pieces
    end

    def dup
    end

    def move_piece!(color, start_pos, end_pos)
    end

end

# b = Board.new

# p b.rows