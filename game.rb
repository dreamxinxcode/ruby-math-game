require_relative './player'
require_relative './question'

class Game
    
    def initialize()
        @player1 = Player.new('1')
        @player2 = Player.new('2')
        @players = [@player1, @player2]
        @score = 0
    end

    def new_turn
        puts "----- NEW TURN -----"
        @players.rotate!
    end

    def gen_question
        @current_question = Question.new();
        @current_player = @players[0]
        puts "Player #{@current_player.name}: What does #{@current_question.num1} plus #{@current_question.num2} equal?"
    end

    def get_anwser
        print '> '
        @guess = gets.chomp.to_i
    end    

    def correct?
        @guess == @current_question.answer
    end

    def right
        puts "Player #{@current_player.name}: YES! You are correct."
        @current_player.score += 1
    end

    def wrong
        puts "Player #{@current_player.name}: Seriously? No!"
        @current_player.lives -= 1              
    end

    def show_score
        puts "P1: #{@player1.score}/3 vs P2: #{@player2.score}/3"
    end

    def game_over?
        @player1.lives <= 0 || @player2.lives <= 0
    end
    
    def end_game
        puts "----- GAME OVER -----"
        puts "Good bye!"
    end

    def play
        until (game_over?) do
            gen_question
            get_anwser

            if correct?
                right
            else
                wrong
            end

            if game_over?
                end_game
                break
            end  

            show_score
            new_turn  
        end
    end        
end