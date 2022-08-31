require "pry-byebug"

def stock_picker(arr)
  # iterations: [3,15] 1
  profitable = []

  arr.each_with_index do |val, idx|
    if profitable.empty? 
      profitable.push(val)
    elsif val < profitable[0] && profitable.length == 1
      profitable.pop
      profitable.push(val)
    elsif val > profitable[0]
      if profitable.length == 1
        profitable.push(val)
      elsif val > profitable[1]
        profitable.pop
        profitable.push(val)
      end
    end

  end

  profitable

end


stock_prices_set_a = [17,3,6,9,15,8,6,1,10]
stock_prices_set_b = [10,11,2,4,5,1,20,5,4]
p stock_picker(stock_prices_set_b)