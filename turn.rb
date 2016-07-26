require './player'
require './question'

class Turn
  attr_accessor :player

  def initialize(player)
    @player = player
  end

  def scorecard
    puts "Player #{@player.name} has #{@player.lives}/3 left!"
  end

 def play_turn
    q = Question.new
    a, b = Question.generate_random_number
    answer = a + b
    is_correct = Question.ask_and_check(answer, a, b)
    if !is_correct
      puts "Uh oh, you got it wrong"
      puts @players
      @player.lives -= 1
      scorecard
    else
      puts "You got it right!"
      scorecard
    end
  end


end