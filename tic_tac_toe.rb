class Player
  attr_accessor :symbol
  def initialize(symbol)
    @symbol = symbol
  end
end

class Game

end

p1 = Player.new('x')
p2 = Player.new('o')
