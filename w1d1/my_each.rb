class Array

  def my_each
    self.length.times do |index|
      yield self[index]
    end
    self
  end

end


return_value = [1, 2, 3].my_each do |num|
  puts num
end.my_each do |num|
  puts num
end