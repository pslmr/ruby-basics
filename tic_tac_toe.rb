class Game
  def initialize(player)
    @player = player
    @board = [
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' ']
    ]
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

new_game = Game.new("player")
new_game.display_board
