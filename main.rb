require 'pry'
require './game'
require './player'

p1 = Player.new('P1')
p2 = Player.new('P2')

g = Game.new([p1, p2])

g.play_turn

