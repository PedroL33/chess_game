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
        piece.pos = location
        piece.board = self
        #p self.board
    end

    def remove(piece)
        @board[piece.pos[0]][piece.pos[1]] = '_'
        #add to graveyard
    end

    def move(piece, location)
        remove(piece)
        add(piece, location)
    end


end