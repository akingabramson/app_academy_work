def median(array)
  array.sort!
  if array.count % 2 == 1
    return array[(array.count/2)]
  else
    return ((array[array.count/2 -1]+array[array.count/2])/2.0).to_f
  end
end

p median([1,2,3,4,5,6,7,8, 9, 10])

p median([3, 9, 4])