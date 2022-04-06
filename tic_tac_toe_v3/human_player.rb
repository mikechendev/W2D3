class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts @mark
        puts 'Please enter 2 numbers with a space in between'
        pos = gets.chomp.split.map { |n| n.to_i }
        if !legal_positions.include?(pos)
            puts 'not a valid position choose another'
            pos = gets.chomp.split.map { |n| n.to_i }
        end
        return pos
    end

end