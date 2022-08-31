def caesar_cipher(text, to_shift = 5)
  # char_arr = text.downcase.split(//)
  # num_arr = char_to_num(char_arr) 
  num_arr = char_to_num(text.chars)
  shifted_arr = shift(num_arr, to_shift)
  puts "Caesar cipher: " << num_to_char(shifted_arr).join

end

#Converts char values to it's integer ordinal value, reverts changes if value is outside of 97..122 ** 65..90
def char_to_num(arr)
  new_arr = arr.map do |x|
      x = x.ord
      if x < 97 && x > 90 || x < 65 || x > 122
        x = x.chr
      end
      x
  end
  new_arr

end 

#Converts integer ordinal to char counterpart, only if value is an integer/numeric
def num_to_char(arr)
  new_arr = arr.map do |x|
    if x.class == Integer
     x = x.chr
    end
    x
  end
  new_arr

end

#shifts every value based on given shift factor, ignores shift if value is not a number. 
#checks if val represents an uppercase char or lowercase, based on ordinal integer conversion value. Then does the shift based on shift factor 
def shift(arr, to_shift)
  arr.map do |val|
    if val.class == Integer
      val += to_shift
      if val > 122
        val = 96 + ((122 - val) * -1)
      elsif val > 90 && val < 97
        val = 64 + ((90 - val) * -1)
      end
    end
    val
  end

end


print "Enter string: "
text = gets.chomp
print "Enter shift factor: "
shift_factor = gets.chomp

# caesar_cipher("What a String!",5)
caesar_cipher(text,shift_factor.to_i)



