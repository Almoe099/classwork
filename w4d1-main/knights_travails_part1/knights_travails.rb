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

    attr_accessor :root_node, :considered_positions
    
    def build_move_tree

        self.root_node = PolyTreeNode.new(start)

        nodes = [@root_node]

        until nodes.empty?
            current_node = nodes.shift
            current_pos = current_node.value

            arr = new_move_positions(current_pos)

            arr.each do |next_pos|
                next_node = PolyTreeNode.new(next_pos)
                current_node.add_child(next_pos)
                nodes << next_pos
            end
        end
    end

    def find_path(end_pos)
        end_node = root_node.dfs(end_pos)
    
        trace_path_back(end_node)
          .reverse
          .map(&:value)
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

    def trace_path_back(end_node)
        nodes = []
    
        current_node = end_node
        until current_node.nil?
          nodes << current_node
          current_node = current_node.parent
        end
        nodes
    end
end

if $PROGRAM_NAME == __FILE__
    kpf = KnightPathFinder.new([0, 0])
    p kpf.find_path([7, 7])
end