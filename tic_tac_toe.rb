require 'pry-byebug'

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
    i = 1
    while true
      if i.odd?
        display_board
        puts "\n"
        print 'P1 enter position (1-9): '
        p1_choice = gets.chomp
        while @player2_moves.include?(p1_choice) || @player1_moves.include?(p1_choice)
          puts 'Position already occupied, choose another position!'
          print 'P1 enter position (1-9): '
          p1_choice = gets.chomp
        end
        @player1_moves.push(p1_choice.to_i)
        p1_pos(p1_choice)
        if check_winner
          display_board
          return puts 'P1 wins'
        end
      else
        display_board
        puts "\n"
        print 'P2 enter position (1-9): '
        p2_choice = gets.chomp
        while @player2_moves.include?(p2_choice) || @player1_moves.include?(p2_choice)
          puts 'Position already occupied, choose another position!'
          print 'P2 enter position (1-9): '
          p2_choice = gets.chomp
        end
        @player2_moves.push(p2_choice.to_i)
        p2_pos(p2_choice)
        if check_winner
          display_board
          return puts 'P2 wins'
        end
      end
      puts "\n"
      i += 1
    end

  end

  def check_winner
    winning_patterns = [
      [1, 2, 3],
      [4, 5, 6],
      [7, 8, 9],
      [1, 4, 7],
      [2, 5, 8],
      [3, 6, 9],
      [1, 5, 9],
      [3, 5, 7]
    ]

    # binding.pry

    winning_patterns.each do |row|
      if row.eql?(@player1_moves.sort)
        return true
      elsif row.eql?(@player2_moves.sort)
        return true
      end
    end

    false
  end

  def p1_pos(choice)
    case choice.to_i
    when 1
      @board[0][0] = 'x'
    when 2
      @board[0][2] = 'x'
    when 3
      @board[0][4] = 'x'
    when 4
      @board[2][0] = 'x'
    when 5
      @board[2][2] = 'x'
    when 6
      @board[2][4] = 'x'
    when 7
      @board[4][0] = 'x'
    when 8
      @board[4][2] = 'x'
    when 9
      @board[4][4] = 'x'
    else
      puts "Invalid input"
    end
  end

  def p2_pos(choice)
    case choice.to_i
    when 1
      @board[0][0] = 'o'
    when 2
      @board[0][2] = 'o'
    when 3
      @board[0][4] = 'o'
    when 4
      @board[2][0] = 'o'
    when 5
      @board[2][2] = 'o'
    when 6
      @board[2][4] = 'o'
    when 7
      @board[4][0] = 'o'
    when 8
      @board[4][2] = 'o'
    when 9
      @board[4][4] = 'o'
    else
      puts 'Invalid input'
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

