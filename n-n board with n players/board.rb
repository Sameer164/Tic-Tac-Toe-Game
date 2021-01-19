class Board

    attr_reader :grid

    def initialize(n)
        @grid = Array.new(n) {Array.new(n, '_')}
        @size = n

    end

    def valid?(position)
        if (position[0] > (@size - 1) || position[0] < 0) || (position[1] > (@size - 1) || position[1] < 0) 
            return false
        end
        return true
    end
    

    def empty?(position)
        return true if @grid[position[0]][position[1]] == '_'
        return false
    end


    def place_mark(position, mark)
        if (valid?(position) && empty?(position))
            @grid[position[0]][position[1]] = mark
        elsif (!valid?(position))
            raise 'The specified position is not valid'
        else
            raise 'The position is filled'
        end
    end

    def prints
        @grid.each do |tow|
            puts
            tow.each do |towe|
                print towe + '   '
            end
            puts
            puts
        end
    end

    def win_row?(mark)
        @grid.any? {|row| row.all? {|ele| ele == mark}}
    end

    def win_col?(mark)
        @grid.transpose.any? {|col| col.all? {|ele| ele == mark}}
    end

    def win_diagonal?(mark)
        height = @grid.length
        width = @grid.length
        curr_height = 0
        curr_width = 0
        count = 0

        ele = mark
        while curr_height < height
            if @grid[curr_height][curr_width] != ele
                break
            elsif @grid[curr_height][curr_width] == ele && curr_height !=0
                count += 1
            end
            curr_height += 1
            curr_width += 1
        end

        if count == (width - 1)
            return true
        end
        
        count = 0
        curr_width =  0
        curr_height = height - 1
        ele2 = mark
        while curr_width < width
            if @grid[curr_height][curr_width] != ele2
                break
            elsif  @grid[curr_height][curr_width] == ele2 && curr_height != (height - 1)
                count += 1
            end
            curr_height -= 1
            curr_width += 1
        end

        if count == (width - 1)
            return true
        end


        return false

    end

    def win?(mark)
        return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        @grid.any? {|row| row.any? {|ele| ele == "_"}}
    end




end



