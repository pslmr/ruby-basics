class Player
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end
end

class Game

  def initialize(player)
      @player = player
      @board = [
      [" ", "|", " ", "|", " "],
      ["-", "+", "-", "+", "-"],
      [" ", "|", " ", "|", " "],
      ["-", "+", "-", "+", "-"],
      [" ", "|", " ", "|", " "]]
  end

  def display_board
    @board.each do |row|
      row.each do |col|
        print col
      end
      print "\n"
    end
  end
end

p1 = Player.new('x')
p2 = Player.new('o')
new_game = Game.new("player")
new_game.display_board
