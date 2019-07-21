class Pawn

    attr_accessor :pos, :board
    attr_reader :symbol, :player, :moves

    def initialize(player)
        @player = player
        @pos = nil
        @board = nil
        @moves = []
        @moved = false
        @symbol = @player == 1 ? "\u{265F}" : "\u{2659}"
    end

    def get_moves
        moves = player == 1 ? [[0,1], [0,2], [1,1], [-1,1]] : [[0,-1], [0,-2], [1,-1], [-1,-1]]
        
        loc = []
        moves.each { |item| loc.push([item[0] + @pos[0], item[1]+ @pos[1]]) }
        
        pieces = []
        loc.each{ |item| pieces.push(@board.get(item[0], item[1])) }
        
        if pieces[0] != nil && pieces[0].class == String
            @moves.push(loc[0])
            @moves.push(loc[1]) if pieces[1] != nil && pieces[1].class == String && !@moved
        end

        [pieces[2], pieces[3]].each_with_index { |item| @moves.push(item.pos) if item != nil && item.class != String && item.player != @player}
    
    end


end
