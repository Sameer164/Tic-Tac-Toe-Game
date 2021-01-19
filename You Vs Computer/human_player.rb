class HumanPlayer
    
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
        
    end

    def get_position(legal_positions)
        chosen = false
        while !chosen
            puts "Enter the 'row col' numbers in the specified pattern. Your mark is #{@mark}"
            input = gets.chomp
            position = input.split(' ')
        
            pos = position.map{|ele| ele.to_i}
            if legal_positions.include?(pos)

                chosen = true
            else
                puts "#{pos} is not a legal option"
            end
        end
        return pos
        
    end
end



