require_relative "tree_node.rb"

# Class Constants knight moves based on gird position

class KnightPathFinder
    attr_reader :start
    MOVES = [
        [-1, 2], [1, 2],
        [-2, 1], [2, 1],
        [-2, -1], [2, -1],
        [-1, -2], [1, -2]
    ].freeze

    def initialize(start)
        @start = start
        @root_node = PolyTreeNode.new(@start)
        @considered_positions = [start]
    end
    
    def build_move_tree

        queue = [@root_node]

        until queue.empty?
            shifted = queue.shift

            arr = new_move_positions(shifted.value)

            arr.each do |el|
                @root_node.add_child(el)
                queue << el
            end


        end

    end

    def find_path(position)
        
    end

    def self.valid_moves(pos)
        x, y = pos
        valid = []
        MOVES.each do |move|
            row, col = move
            new_x = row + x
            new_y = col + y

            if (0..7).to_a.include?(new_x) && (0..7).to_a.include?(new_y)
                valid << [new_x, new_y]
            end
        end 
        valid 
    end 

    def new_move_positions(pos)
        valid = KnightPathFinder.valid_moves(pos)
        new_arr = []
        valid.each do |move| 
            if !@considered_positions.include?(move)
                new_arr << move
            end
            @considered_positions += new_arr
        end
        new_arr
    end

end
