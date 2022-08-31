require "pry-byebug"

def sub_string(text, arr)
  arr.reduce(Hash.new(0)) do |acc,val|
    # binding.pry
    if text.include?(val)
      occurence = text.scan(val).count
      acc[val] += occurence
    end
    acc
  end

end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
print "Enter text: "
text = gets.chomp

puts sub_string(text.downcase, dictionary)