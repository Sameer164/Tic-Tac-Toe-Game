require_relative './board.rb'
require_relative './human_player.rb'
require_relative './computer_player.rb'

class Game
    def initialize(n, hash)
        @player_hash = hash
        if @player_hash[@player_hash.to_a[0][0]]
            @current_player = ComputerPlayer.new(@player_hash.to_a[0][0])
        else
            @current_player = HumanPlayer.new(@player_hash.to_a[0][0])
        end
        @board = Board.new(n)
        @player_arr = @player_hash.to_a
    end

    def switch_turn
        current_player_mark = @player_arr.rotate![0][0]
        if @player_hash[current_player_mark]
            @current_player = ComputerPlayer.new(current_player_mark)
        else
            @current_player = HumanPlayer.new(current_player_mark)
        end
    end

    def play
        while @board.empty_positions?
            @board.prints
            pos = @current_player.get_position(@board.legal_positions)
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
 
g = Game.new(3, 'O' => false, 'X' => true)
g.play