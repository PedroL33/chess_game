require './helpers.rb'
class Bishop

    include Helpers 

    attr_accessor :pos, :board
    attr_reader :symbol, :player

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @symbol = @player == 1 ? "\u{265D}" : "\u{2657}"
    end

    def get_moves
        moves = []

        check = [[-1,1], [1,1], [-1,-1], [1,-1]]
    
        check.each do |item|
            proc = Proc.new{|element| [element[0] - item[0], element[1] - item[1]]} 
            next_item = proc.call(@pos)
            moves += get_axis(next_item, proc)
        end
        
        moves
    end

end