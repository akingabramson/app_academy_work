def returner(range)
  range.select {|x| (x**0.5 - x**0.5.to_i).to_s.length <= 3 }
end

nums = (1..100)
p returner(nums)