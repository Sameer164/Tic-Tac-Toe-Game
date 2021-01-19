class ComputerPlayer
    attr_reader :mark
    
    def initialize(mark)
        @mark = mark
    end

    def get_position(legal_positions)
        pos = legal_positions.sample
        puts "The Computer is #{@mark} and it has chosen #{pos}"
        return pos
    end

end