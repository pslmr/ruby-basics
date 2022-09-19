class Game
  def initialize
    @player1_moves = []
    @player2_moves = []
    @board = [
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' ']
    ]
    play
  end

  def play
    display_board

    i = 1
    while true
      if i.odd?
        display_board
        puts 'P1 enter position (1-9): '
        p1_choice = gets.chomp
        p1_pos(p1_choice)
      else
        display_board
        puts 'P2 enter position (1-9): '
        p2_choice = gets.chomp
      end

      i += 1
    end

  end

  def p1_pos(choice)
    case choice
    when 1
      @board[0][0] = x
    when 2
      @board[0][2] = x
    when 3
      @board[0][4] = x
    when 4
      @board[2][0] = x
    when 5
      @board[2][2] = x
    when 6
      @board[2][4] = x
    when 7
      @board[4][0] = x
    when 8
      @board[4][2] = x
    when 9
      @board[4][4] = x
    else
      puts "Invalid input"
    end
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

new_game = Game.new

