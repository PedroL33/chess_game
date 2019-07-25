require './helpers.rb'

class King 

    include Helpers
    attr_accessor :pos, :board, :moved
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
                moves.push(move) if !check_and_return(@board.get(@pos), move, self)
            end
        end

        if !@moved 

            row = []
            for i in 0..7
                row.push(@board.get([i, @pos[1]]))
            end

            if row[0].class == Rook && row[1,3].all?{ |item| item == '_' } && row[0].moved == false
                moves.push([@pos[0] - 2, @pos[1]])
            end 
            
            if row[7].class == Rook && row[5..6].all?{ |item| item == '_' } && row[7].moved == false
                moves.push([@pos[0] + 2, @pos[1]])
            end
        end
        moves
    end

end