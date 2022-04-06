class Board
    #PART 1
    attr_reader :size
  
    def initialize(n)
        @grid = Array.new(n) {Array.new(n, :N)}
        @size = n * n
    end

    def [](arr)
        row = arr[0]
        col = arr[1]
        @grid[row][col]
    end

    def []=(pos, value)
        @grid[pos[0]][pos[1]] = value
    end

    def num_ships
        hash = Hash.new(0)
        @grid.flatten.each { |el| hash[el] += 1 }
        hash[:S]
    end

    #PART 2

    def attack(pos)
        if self.[](pos) == :S
            self.[]=(pos, :H)
            p 'you sunk my battleship!'
            return true
        else
            self.[]=(pos, :X)
            return false
        end 
    end

    def place_random_ships
        n = @size / 4
        rows = Math.sqrt(@size).to_i
        while self.num_ships < n
            pos = [rand(0...rows), rand(0...rows)]
            self.[]=(pos, :S)
        end
    end

    def hidden_ships_grid
        h_grid = @grid.dup.map { |arr| arr.dup }
        h_grid.each_with_index do |row, i|
            row.each_with_index do |el, j|
                h_grid[i][j] = :N if h_grid[i][j] == :S
            end
        end
    end

    def self.print_grid(arr)
        result = []
        arr.each do |row|
            puts row.join(' ')
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(hidden_ships_grid)
    end

end
