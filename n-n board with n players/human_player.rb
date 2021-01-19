class HumanPlayer
    
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
        
    end

    def get_position
        puts "Enter the 'row col' numbers in the specified pattern. Your mark is #{@mark}"
        input = gets.chomp
        position = input.split(' ')
        
        pos = position.map{|ele| ele.to_i}
        return pos
        
    end
end



