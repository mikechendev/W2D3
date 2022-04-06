class HumanPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position
        puts @mark
        puts 'Please enter 2 numbers with a space in between'
        pos = gets.chomp.split.map { |n| n.to_i }
        raise 'please enter 2 numbers' if pos.length != 2
        raise 'only 1 space between numbers please' if ' '.length != 1
        return pos
    end
end