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
                str += "#{@board[idx][i].to_s}|"
            end
            str += "\n"
        end
        str += "  0 1 2 3 4 5 6 7 \n"
        print str
    end

    def add_piece

    end

end

board = Board.new
board.display
puts board.board[6][5]