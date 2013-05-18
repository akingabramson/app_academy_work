def concat(array)
  array.inject("") do |accum, element|
    accum + element
  end

end

p concat(["Yay ", "for ", "strings!"])