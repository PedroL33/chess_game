require './get_elements.rb'
class Bishop

    include Elements 

    attr_accessor :pos, :board
    attr_reader :symbol, :player, :moves

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moved = false
        @symbol = @player == 1 ? "\u{265D}" : "\u{2657}"
    end

    def get_moves
        moves = []

        up_left = Proc.new{|item| [item[0]-1, item[1]+1]}
        up_right = Proc.new{|item| [item[0]+1, item[1]+1]}
        down_left = Proc.new{|item| [item[0]-1, item[1]-1]}
        down_right = Proc.new{|item| [item[0]+1, item[1]-1]}

        [up_left, up_right, down_left, down_right].each{ |item| 
            next_item = item.call(pos)
            moves += get_axis(next_item, item)
        }
        moves
    end

end