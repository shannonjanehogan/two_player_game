require './game'

class Question
  def initialize

  end

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