require_relative 'board'
require_relative 'human_player'

class Game

    def initialize(mark_1, mark_2)
        @player_1 = HumanPlayer.new(mark_1)
        @player_2 = HumanPlayer.new(mark_2)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
    end

    def play
        while @board.empty_positions?
            @board.print
            pos = @current_player.get_position
            mark = @current_player.mark
            @board.place_mark(pos, mark)
            if @board.win?(mark)
                puts 'victory'
            else
                self.switch_turn
            end
        end
        puts 'draw'
    end

end