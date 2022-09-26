# frozen_string_literal: true

require_relative 'computer'
require_relative 'player'

class Game
  # attr_accessor :computer

  def initialize
    @computer = Computer.new
  end

  def start
    @computer.gen_code
  end

end
