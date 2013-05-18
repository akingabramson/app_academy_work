def reverse(string1)
  letter_array = string1.split(//)
  final_array = []

  letter_array.each do |letter|
    final_array.unshift(letter)
  end

  return final_array.join("")

end

puts reverse("cat")
puts reverse("The cat jumped")