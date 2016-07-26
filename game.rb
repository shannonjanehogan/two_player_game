require './player'

class Game
  attr_reader :players
  attr_accessor :turn

  def initialize(players)
    @players = players
    @turn = 0
  end

#Instance Methods
  def scorecard
    puts "Player #{@players[@turn].name} has #{@players[turn].lives}/3 left!"
  end

  def play_turn
    a, b = Game.generate_random_number
    answer = a + b
    is_correct = Game.ask_and_check(answer, a, b)
    if !is_correct
      puts "Uh oh, you got it wrong"
      @players[@turn].lives -= 1
      if should_game_continue
        scorecard
        switch_turns
        play_turn
      else
        puts "Game over!"
      end
    else
      puts "You got it right!"
      scorecard
      switch_turns
      play_turn
    end
  end

  def switch_turns
    @turn = @turn == 1 ? 0 : 1
  end

  def should_game_continue
    @players.each do |player|
      if player.lives == 0
        return false
      end
    end
    true
  end

#Class Method
  def self.generate_random_number
    a = rand(0...21)
    b = rand(0...21)
    [a, b]
  end

  def self.ask_and_check(answer, a, b)
    puts "What is the sum of #{a} and #{b}?"
    gets.chomp.to_i == answer
  end

end