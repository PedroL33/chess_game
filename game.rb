require './pawn.rb'
require './rook.rb'
require './board.rb'
require './knight.rb'
require './bishop.rb'
require './queen.rb'
require './king.rb'
require './helpers'
class Game
    include Helpers
    def initialize
        @board = Board.new
        @king1 = King.new(1)
        @king2 = King.new(2)
        @board.add(@king1, [4,0])
        @board.add(@king2, [4,7])
        [1,2].each do |item|

            for i in 0..7
                pawn = Pawn.new(item)
                item == 1 ? @board.add(pawn, [i,1]) : @board.add(pawn, [i,6])
            end

            y = item == 1 ? 0 : 7
            @board.add(Rook.new(item), [0,y])
            @board.add(Rook.new(item), [7,y])
            @board.add(Knight.new(item), [1,y])
            @board.add(Knight.new(item), [6,y])
            @board.add(Bishop.new(item), [2,y])
            @board.add(Bishop.new(item), [5,y])
            @board.add(Queen.new(item), [3,y])
        end
    
        @turn = 1
        @board.display

    end

    def play
        piece = nil
        location = nil
        opponent = @turn == 1 ? @king2  : @king1
        owner = @turn == 1 ? @king1 : @king2

        while piece == nil && location == nil
            print "Player #{@turn}, choose a move: "
            response = gets.chomp
            move = response.split(" to ")
            if move.all? { |moves| moves.match(/^[0-7] [0-7]$/) }
                moves = move.map!{|item| item.split(' ').map!{|item| item = item.to_i } }
                p moves
                if @board.get(moves[0]) != '_' && @board.get(moves[0]).player == @turn && @board.get(moves[0]).get_moves.include?(moves[1])
                    location = moves[1]
                    piece = @board.get(moves[0])
                end
            else
                puts "Not a valid move."
            end

        end

        memory = [piece.pos, @board.get(location)]

        @board.move(piece, location)

        if check?(owner)
            @board.move(piece, memory[0])
            @board.add(memory[1], location)
            @board.display
            puts "That move would endanger your king."
            play
        elsif check?(opponent)
            if checkmate?(opponent)
                @board.display
                puts "Checkmate. Player #{@turn} wins!"
            else
                @board.display
                puts "Check"
                @turn = @turn == 1 ? 2 : 1
                play
            end
        else
            @board.display
            @turn = @turn == 1 ? 2 : 1
            play
        end
    end

end

game = Game.new
game.play




