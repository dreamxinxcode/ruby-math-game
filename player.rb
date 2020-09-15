class Player
    attr_accessor :score, :lives
    attr_reader :name

    def initialize(name)
        @name = name
        @score = 0
        @lives = 3
    end

    def lost?
        @lives <= 0
    end
end
