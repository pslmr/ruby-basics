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
    puts find_match
    p @computer.code_combo
  end

  def find_match
    match = ['Match: ']
    @computer.code_combo.each_with_index do |x, i|
      match.push('M') if x == @player.code_guess[i]
    end
    match.join(' ')
  end

end
