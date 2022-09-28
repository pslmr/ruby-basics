class Computer
  NUM_POOL = [1, 2, 3, 4, 5, 6]

  attr_reader :code_combo

  def initialize
    @code_combo = []
  end

  def gen_code
    @code_combo = 4.times.map { Random.rand(6)+1 }
  end
end
