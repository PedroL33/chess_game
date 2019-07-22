class Knight

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
            if !new_pos.any?{|item| item > 7 || item < 0}
                piece = @board.get(new_pos[0], new_pos[1])
                if piece.class == String || piece.player != @player
                    moves.push(new_pos)
                else 
                    next
                end                        
            end
        }
        moves
    end

end