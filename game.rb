require './player'
require './turn'

class Game
  attr_reader :players
  attr_accessor :turn

  def initialize(players)
    @players = players
    @turn = 1
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

  def turn_loop
    while should_game_continue
      switch_turns
      t = Turn.new(@players[@turn])
      t.play_turn
    end
    if !should_game_continue
      puts "Game over!"
    end
  end

end
