module Helpers

    def get_axis(next_pos, proc)
        moves = []

        while legal?(next_pos)
            moves.push(next_pos)
            break if @board.get(next_pos).class != String && @board.get(next_pos).player != @player
            next_pos = proc.call(next_pos)
        end

        moves
    end

    def legal?(pos)
        if !pos.any?{|item| item > 7 || item < 0}
            piece = @board.get(pos)
            return true if (piece.class == String || piece.player != @player) 
        end
        return false
    end

    def check?(king) 
        arr = []
        @board.board.each do |item|
            item.each do |element|

                if element.class == String || element.player == king.player
                    next
                elsif element.class == King
                    return true if (element.pos[0] - king.pos[0]).abs < 2 && (element.pos[1] - king.pos[1]).abs < 2
                else   
                    element.get_moves.each {|item| arr.push(item)}
                end
                return true if arr.include?(king.pos)
            end
        end
        return false
    end

    def check_and_return(piece, location, king)
        moved = piece.moved if piece.class == King
        memory = [@board.get(location), piece.pos]
        @board.move(piece, location)
        if !check?(king)
            @board.move(piece, memory[1])
            @board.add(memory[0], location)
            piece.moved = moved if piece.class == King
            return false 
        else
            @board.move(piece, memory[1])
            @board.add(memory[0], location)
            piece.moved = moved if piece.class == King
            return true
        end
    end


    def checkmate?(king)

        @board.board.each do |item|
            item.each do |element|
                if element.class == String || element.player != king.player
                    next
                else
                    element.get_moves.each do |move| 
                        return false if !check_and_return(element, move, king)
                    end
                end
            end
        end
        return true
    end

end