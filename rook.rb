require "./get_elements"

class Rook
    include Elements
    attr_accessor :pos, :board
    attr_reader :symbol, :player, :moves

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moved = false
        @symbol = @player == 1 ? "\u{265C}" : "\u{2656}"
    end

    def get_moves
        up = Proc.new { |item| [item[0], item[1] + 1] }
        down = Proc.new { |item| [item[0], item[1] - 1] }
        right = Proc.new { |item| [item[0] + 1, item[1]] }
        left = Proc.new { |item| [item[0] + 1, item[1]] }
        
        moves = []
        [up, down, left, right].each do |item|
            next_pos = item.call(@pos)
            moves += get_axis(next_pos, item)
        end
        moves
    end

end
