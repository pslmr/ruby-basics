# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'

class Game

  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    @computer.gen_code
    @player.input_guess
    compare
    p @player.code_guess
    p @computer.code_combo
  end

  def compare
    match = 0
    partial = 0
    temp_code = @computer.code_combo.dup
    temp_guess = @player.code_guess.dup
    temp_code.each_with_index do |x, i|
      if x == temp_guess[i]
        temp_guess[i] = 'm'
        temp_code[i] = 'g'
        match += 1
      end
      next
    end

    temp_code.each_with_index do |x, i|
      if temp_guess.include?(x)
        mark_partial_idx = temp_guess.index(x)
        temp_guess[mark_partial_idx] = 'm'
        temp_code[i] = 'g'
        partial += 1
      end
    end

    puts "\nMatch: #{match} Partial: #{partial}"
  end
end
