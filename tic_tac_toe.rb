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
    play_match
  end

  def play_match
    play_round
    loop do
      print 'Up for another game?(Y/N): '
      choice = gets.chomp.downcase
      if choice == 'y'
        clear_board
        play_round
      elsif choice == 'n'
        puts 'Thank you for playing!'
        break
      else
        puts 'Invalid choice.'
      end
    end
  end

  def play_round
    i = 1
    while true
      if i.odd?
        display_board
        puts "\n"
        print 'P1 enter position (1-9): '
        p1_choice = gets.chomp.to_i
        while @player2_moves.include?(p1_choice) || @player1_moves.include?(p1_choice)
          puts 'Position already occupied, choose another position!'
          print 'P1 enter position (1-9): '
          p1_choice = gets.chomp.to_i
        end
        @player1_moves.push(p1_choice)
        player = 'p1'
        assign_pos(p1_choice, player)
        if check_winner(player)
          puts "\n"
          display_board
          puts "\n"
          return puts 'P1 wins'
        end
      else
        display_board
        puts "\n"
        print 'P2 enter position (1-9): '
        p2_choice = gets.chomp.to_i
        while @player2_moves.include?(p2_choice) || @player1_moves.include?(p2_choice)
          puts 'Position already occupied, choose another position!'
          print 'P2 enter position (1-9): '
          p2_choice = gets.chomp.to_i
        end
        @player2_moves.push(p2_choice)
        player = 'p2'
        assign_pos(p2_choice, player)
        if check_winner(player)
          puts "\n"
          display_board
          puts "\n"
          return puts 'P2 wins'
        end
      end
      puts "\n"
      i += 1
    end
  end

  def clear_board
    @player1_moves = []
    @player2_moves = []
    @board = [
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' '],
      ['-', '+', '-', '+', '-'],
      [' ', '|', ' ', '|', ' ']
    ]
    puts 'Game board cleared!'
    puts "\n"
  end

  def check_winner(player)
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

    player = player == 'p1' ? @player1_moves : @player2_moves

    winning_patterns.any? do |row|
      row.all? do |val|
        player.include?(val)
      end
    end
  end

  def assign_pos(choice, player)
    player == 'p1' ? marker = 'x' : marker = 'o'

    case choice.to_i
    when 1
      @board[0][0] = marker
    when 2
      @board[0][2] = marker
    when 3
      @board[0][4] = marker
    when 4
      @board[2][0] = marker
    when 5
      @board[2][2] = marker
    when 6
      @board[2][4] = marker
    when 7
      @board[4][0] = marker
    when 8
      @board[4][2] = marker
    when 9
      @board[4][4] = marker
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

