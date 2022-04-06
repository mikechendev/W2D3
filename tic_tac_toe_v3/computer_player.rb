class ComputerPlayer
    attr_reader :mark

    def initialize(mark_value)
        @mark = mark_value
    end

    def get_position(legal_positions)
        puts @mark
        pos = legal_positions.sample
        puts "#{@mark} chose position #{pos}"
        pos
    end

end