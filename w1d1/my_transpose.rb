def my_transpose(input)
  final_product = []
  input[0].length.times do |x|
    final_product << []
  end
  input.each_with_index do |value, index1|
    value.each_with_index do |item, index2|
      final_product[index2][index1] = item
    end
  end
  return final_product
end

p my_transpose([[0, 3, 6],
[1, 4, 7],
[2, 5, 8]])

# p [[0, 3, 6],
# [1, 4, 7],
# [2, 5, 8]]