require './helpers'
class Knight
    include Helpers
    attr_accessor :pos, :board
    attr_reader :symbol, :player, :moves

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moved = false
        @symbol = @player == 1 ? "\u{265E}" : "\u{2658}"
    end

    def get_moves
        check = [[1,2], [2,1], [2,-1], [1,-2], [-1,-2], [-2,-1], [-2,1], [-1,2]]
        moves = []
        check.each { |item|
            new_pos = [@pos[0]+item[0], @pos[1]+item[1]]
            legal?(new_pos) ? moves.push(new_pos) : next                      
        }
        moves
    end

end