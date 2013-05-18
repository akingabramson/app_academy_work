def count (array)
  hash = {}
  array.each do |item|
    if hash.has_key?(item)
      hash[item] += 1
    else
      hash[item] = 1
    end
  end

  hash
end

p count([12,43,22,22,22,12])