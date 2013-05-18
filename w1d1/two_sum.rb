def two_sum?(array1)
  array1.each_with_index do |num, index|
    array2 = array1[0..index] + array1[index+1 ..array1.count]
    array2.each do |num2|
      if (num + num2) == 0
        return true
      end
    end
  end
  false
end

puts two_sum?([2, 1, 1])