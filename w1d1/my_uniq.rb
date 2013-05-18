class Array

  def my_uniq
      final_hash = Hash.new
      self.each do |item|
      final_hash.has_key?(item) ? final_hash[item] += 1 : final_hash[item] = 1
      end
      return final_hash.keys
  end
end

p [1,2,3,3].my_uniq