class Board
    attr_accessor :grid

    def initialize
        @grid = Array.new(3) {Array.new(3, '_')}
    end

    def valid_move?(pos)
        pos.all? { |n| n >= 0 && n <= 2 }
    end

    def empty?(pos)
        @grid[pos[0]][pos[1]] == '_'
    end

    def place_mark(pos, mark)
        raise 'not valid move' if !valid_move?(pos) || !empty?(pos)
        @grid[pos[0]][pos[1]] = mark
    end
    
    def print
        @grid.each { |row| p row }
    end

    def win_row?(mark)
        @grid.each do |row|
            return true if row.uniq.count == 1 && row.uniq.include?(mark)
        end
        false
    end

    def win_col?(mark)
        transposed = @grid.transpose
        transposed.each do |row|
            return true if row.uniq.count == 1 && row.uniq.include?(mark)
        end
        false
    end

    def win_diagonal?(mark)
        diag_up.all? { |el| el == mark} || diag_down.all? { |el| el == mark }
    end

    def diag_down
        diags = []
        i = 0
        while i < @grid.length
            diags << @grid[i][i]
            i += 1
        end
        diags
    end

    def diag_up
        diags = []
        i = 0
        j = @grid.length - 1
        while i < @grid.length
            diags << @grid[i][j]
            i += 1
            j -= 1
        end
        diags
    end

    def win?(mark)
        win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.each do |row|
            row.each { |el| return true if el == '_' }
        end
        false
    end
end