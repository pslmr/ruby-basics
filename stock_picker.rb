require "pry-byebug"

def stock_picker(arr)
  buy = arr[0]
  buy_idx = 0
  profit = 0

  arr.each_with_index.reduce(Array.new(2,0)) do |acc, (val, i)|
    if val < buy
      buy = val
      buy_idx = i 
      next
    end

    if val - buy > profit
      profit = val - buy
      acc = [buy_idx, i]
    end

    acc
  end

end

stock_prices_set_a = [17,3,6,9,15,8,6,1,10]
stock_prices_set_b = [10,11,2,4,5,1,20,5,4]
p stock_picker(stock_prices_set_a)