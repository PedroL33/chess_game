module Elements

    def get_axis(next_pos, proc)
        moves = []
        while next_pos.all?{ |item| item <= 7 && item >= 0 }
            next_item = @board.get(next_pos[0], next_pos[1])
            if next_item.class != String
                if next_item.player == @player
                    break
                else 
                    moves.push(next_pos)
                    break
                end
            else
                moves.push(next_pos)
                next_pos = proc.call(next_pos)
            end
        end
        moves
    end

end