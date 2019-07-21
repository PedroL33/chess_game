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
            @board.each_with_index do |item, idx|
                (@board[idx][i].class==String) ? str += "#{@board[idx][i]}|" : str+="#{@board[idx][i].symbol}|"
            end
            str += "\n"
        end
        str += "  0 1 2 3 4 5 6 7 \n"

        print str
    end

    def get(x, y)
        @board[x][y]
    end

    def add(piece, location)
        @board[location[0]][location[1]] = piece
        piece.pos = location
    end

    def remove(piece)
        @board[piece.pos[0]][piece.pos[1]] = '_'
        #add to graveyard
    end

    def move(piece, location)
        add(piece, location)
        remove(piece)
    end


end