require_relative 'board'
require_relative 'human_player'

class Game

    def initialize(size, *marks)
        @players = marks.map { |mark| HumanPlayer.new(mark) }
        @current_player = @players.first
        @board = Board.new(size)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players.first
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