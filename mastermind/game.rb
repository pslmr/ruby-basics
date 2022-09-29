# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'

class Game
  def initialize
    @computer = Computer.new
    @player = Player.new
  end

  def start
    puts "\n=============== NEW GAME ==============="
    @computer.gen_code
    round == true ? win : lose
  end

  def win
    puts "\nYou won! The secret code was #{@computer.code_combo}."
    again
  end

  def lose
    puts "\nYou lost! The secret code was #{@computer.code_combo}."
    again
  end

  def again
    repeat = true
    while repeat
      print 'Do you want to pay again?[Y/N]: '
      ans = gets.chomp.upcase
      case ans
      when 'Y'
        repeat = false
        start
      when 'N'
        repeat = false
        puts "\nThanks for playing! :)"
        return
      else
        puts "\nInvalid choice! Try again."
      end
    end
  end

  def round
    attempts = 1
    while attempts <= 12
      puts "\n---------------- ROUND #{attempts} ---------------"
      @player.input_guess
      return true if compare == 4
      attempts += 1
    end
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

    puts "\nYour guess: #{@player.code_guess}"
    puts "Match: #{match} Partial: #{partial}"
    return match if match == 4
  end

end
