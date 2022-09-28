class Player
  attr_reader :code_guess

  def intialize
    @code_guess
  end

  def input_guess
    temp_guess = []
    i = 1
    while i <= 4
      print "Enter guess ##{i}. [1-6]: "
      val = gets.chomp.to_i
      next if val > 6 || val < 1

      temp_guess.push(val)
      i += 1
    end
    @code_guess = temp_guess
  end
end
