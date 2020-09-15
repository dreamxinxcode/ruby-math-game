class Game
    
    def initialize()
        @player1 = Player.new('1')
        @player2 = Player.new('2')
        @players = [@player1, @player2]
        @current_player = @players[0]
        @score = 0
        @round = 1
    end

    def show_score
        puts `P1: #{}/3 vs P2: #{}/3`
    end

    def gen_question
        question = Question.new();
        puts "Player #{}: What does #{question.num1} plus #{question.num2} equal?"
    end
    
    def get_anwser
        answer = gets.chomp()
    end    

    def game_over?

    end
    

    def play
        until (game_over?) do
            gen_question
            get_anwser        
        end
    end        
end


class Player
    attr_accessor :score
    attr_reader = :name

    def initialize(name)
        @name = name
        @score = 0
    end
end


class Question
    attr_reader :answer, :num1, :num2

    def initialize
        @num1 = rand(1..10)
        @num2 = rand(1..10)
        @answer = @num1 + @num2
    end

end


# Create game instance
new_game = Game.new

# Call play method
new_game.play