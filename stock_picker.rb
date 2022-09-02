require "pry-byebug"


#For every iteration check if value is less than buy var, if true assign value and index.
#If diff of value and buy is greater than value of profit assign it and change value of days array.
#returns days array after all iterations are done
def stock_picker(arr)
  buy = arr[0]
  buy_idx = 0
  profit = 0
  days = [0,0]

  arr.each_with_index do |v, i|
    if v < buy
      buy = v
      buy_idx = i
      next
    end

    if v - buy > profit 
      profit = v - buy
      days = [buy_idx, i]
    end
  end
  days

end

stock_prices_set_a = [17,3,6,9,15,8,6,1,10]
stock_prices_set_b = [10,11,2,4,5,1,20,5,4]
p stock_picker(stock_prices_set_a)