class Board

    attr_accessor :board

    def initialize
        @board = []
        8.times{ @board.push(Array.new(8, '_')) }
    end
    
    def display
        str = ""
        (@board.length-1).downto(0) do |i|
            str += "#{i.to_s}|"
            self.board.each_with_index do |item, idx|
                (self.board[idx][i].class==String) ? str += "#{self.board[idx][i]}|" : str+="#{self.board[idx][i].symbol}|"
            end
            str += "\n"
        end
        str += "  0 1 2 3 4 5 6 7 \n"

        print str
    end

    def get(location)
        @board[location[0]][location[1]]
    end

    def add(piece, location)
        self.board[location[0]][location[1]] = piece
        if piece.class != String
            piece.board = self
            piece.pos = location
        end
    end

    def remove(piece)
        @board[piece.pos[0]][piece.pos[1]] = '_' if piece.class != String
    end

    def move(piece, location)

        if piece.class == Pawn || piece.class == Rook || piece.class == King
            piece.moved = true
        end

        remove(piece)

        if piece.class == Pawn && (location[1] == 7 || location[1] == 0)
            add(Queen.new(piece.player), location)

        elsif piece.class == King && (piece.pos[0] - location[0]).abs == 2 

            if piece.pos[0] - location[0] == 2 
                rook =  self.get([0, piece.pos[1]])
                new_pos = [piece.pos[0] - 1, piece.pos[1]]
            else
                rook = self.get([7,piece.pos[1]])
                new_pos = [piece.pos[0] + 1, piece.pos[1]]
            end

            add(piece, location)
            remove(rook)
            move(rook, new_pos)
            p rook.moved
        else
            add(piece, location)
        end
    end

end