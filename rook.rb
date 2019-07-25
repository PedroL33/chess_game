require "./helpers"

class Rook
    include Helpers
    attr_accessor :pos, :board, :moved
    attr_reader :symbol, :player

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moved = false
        @symbol = @player == 1 ? "\u{265C}" : "\u{2656}"
    end

    def get_moves
        moves = []

        check = [[0,1], [0,-1], [1,0], [-1,0]]
        
        check.each do |item| 
            proc = Proc.new { |element| [item[0] + element[0], item[1] + element[1]] } 
            next_pos = proc.call(@pos)
            moves += get_axis(next_pos, proc)
        end
        moves
        
    end

end
