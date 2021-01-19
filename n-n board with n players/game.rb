require_relative './board.rb'
require_relative './human_player.rb'

class Game
    def initialize(n, *marks)
        @player_arr = marks
        @current_player = HumanPlayer.new(@player_arr[0])
        @board = Board.new(n)
    end

    def switch_turn
        @current_player = HumanPlayer.new(@player_arr.rotate![0])
    end

    def play
        while @board.empty_positions?
            @board.prints
            pos = @current_player.get_position
            @board.place_mark(pos, @current_player.mark)
            if @board.win?(@current_player.mark)
                @board.prints
                puts "Victory for #{@current_player.mark}"
                return
            else
                self.switch_turn
            end
        end

        puts "The Game Was A Draw.......Wanna Play Again?!"
    end

end

g = Game.new(5, 'X', 'O')
g.play