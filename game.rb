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
    puts "Player #{@player} has #{@players[turn].lives}/3 left!"
  end

  def play_turn
    a, b = Game.generate_random_number
    answer = a + b
    is_correct = Game.ask_and_check(answer, a, b)
    if !is_correct
      puts "Uh oh, you got it wrong"
      @players[@turn].lives -= 1
      # puts should_game_continue.inspect
      if should_game_continue
        switch_turns
        play_turn
      else
        puts "Game over!"
      end
    else
      puts "You got it right!"
      switch_turns
      play_turn
    end
  end

  def switch_turns
    scorecard
    if @turn == 0
      return @turn = 1
    else
      return @turn = 0
    end
    # @turn == 1 ? 0 : 1
    # play_turn
  end

  def should_game_continue
    @players.each do |player|
      if player.lives == 0
        puts "do you reach me?"
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