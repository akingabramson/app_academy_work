def caesar(string, shift)
  cipher = (("a".."z").to_a)
  final = []
  string.downcase.split(//).each do |x|
    if cipher.include?(x) == false
      final.push(" ")
    else
      final.push(cipher[(cipher.find_index(x)+shift)%26])
    end
  end
  return final.join("")
end

p caesar("asher and jonathan",3)