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

def hash_correct (wrong_hash)
  # final = {}
  wrong_hash.keys.map(&:to_s).sort.reverse.each do |letter|
    wrong_hash[caesar(letter.to_s,1).to_sym] = wrong_hash[letter.to_sym]
    wrong_hash.delete(letter.to_sym)
  end
  wrong_hash
  # wrong_hash.each do |letter, value|
 #    final[caesar(letter.to_s,1)] = value
 #  end
 #  return final
end

p hash_correct({ :a => "banana", :b => "cabbage", :c => "dental_floss", :d => "eel_sushi" })