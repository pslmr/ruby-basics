require "pry-byebug"

#assign swapped = true when a swap happens in comparison iteration.
#loop until the inner loop doesn't set swapped to true. Meaning array is already sorted and no swap we're done in that pass
def bubble_sort(arr)
  return arr if arr.length <= 1 #return array if length <= 1, since there is no need for a sort

  n = arr.length
  swapped = true

  while swapped
    swapped = false 
    (n-1).times do |i|
      if arr[i] > arr[i+1]
        arr[i], arr[i + 1] = arr[i +  1], arr[i]
        swapped = true
      end
    end
  end
  arr
  
end


to_sort_a = [4,3,78,2,0,2]
to_sort_b = [9,4,3,7,6,1]

p bubble_sort(to_sort_a)