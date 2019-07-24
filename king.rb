require './helpers.rb'

class King 

    include Helpers
    attr_accessor :pos, :board, :moves
    attr_reader :symbol, :player, :moves

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moved = false
        @symbol = @player == 1 ? "\u{265A}" : "\u{2654}"
    end

    def get_moves
        moves = []

        check = [[0,1], [0,-1], [1,0], [-1,0], [1,1], [1,-1], [-1,-1], [-1,1]]
        
        check.each do |item|
            move = [item[0] + @pos[0], item[1] + @pos[1]]
            if legal?(move)
                memory = [@pos, move]
                replace = @board.get(move)

                @board.move(self, move)
                if !check?(self)
                    moves.push(move)
                end
                @board.move(self, memory[0])
                @board.move(replace, memory[1]) if replace.class != String
            end
        end
        
        moves
    end

end