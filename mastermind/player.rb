class Player
  attr_reader :code_guess

  def intialize
    @code_guess
  end

  def get_guess
    print 'Enter 4 numbers as your guess combination, seperated by spaces.(1-6): '
    input = gets.chomp
    @code_guess = input.split.map {|x| x.to_i }
  end
end
