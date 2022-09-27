# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'

class Game
  # attr_accessor :computer

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    @computer.gen_code
    @player.get_guess
    # puts find_match
    # puts find_partial
    puts compare
    p @computer.code_combo
  end

  def compare
    match = []
    partial = []
    @computer.code_combo.each_with_index do |x, i|
      if x == @player.code_guess[i]
        match.push('M')
      else
        partial.push('P') if @player.code_guess.include?(x)
      end
    end
    feedback = ['Feedback:'] + match + partial
    feedback.join(' ')
  end
end
