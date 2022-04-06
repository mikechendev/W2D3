class Player
    #PART 3

    def get_move
        p "enter a position with coordinates separated with a space like '4 7'"
        result = []
        gets.chomp.split.each { |n| result << n.to_i }
        result
    end
end
