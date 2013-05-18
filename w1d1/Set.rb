def set_add_el(hash, keyname)
  unless hash.has_key?(keyname)
    hash[keyname] = true
  end
  return hash
end

def set_remove_el(hash, rem)
  if hash.has_key?(rem)
    hash.delete(rem)
  end
  return hash
end

def set_list_els(hash)
  return hash.keys
end

def set_member?(hash, keyname)
  return hash.has_key?(keyname)
end

def set_union(hash1, hash2)
  hash2.keys.each do |thing|
    set_add_el(hash1, thing)
  end
  return hash1
end

def set_intersection(hash1, hash2)
  final = {}
  hash1.each {|k, v|
    if hash2[k] == v
    final[k] = v
  end
   }
  return final
end

def set_minus(hash1, hash2)
  final = {}
  hash1.each {|k, v|
    if hash2[k] != v
    final[k] = v
  end
   }
  return final
end


# p set_intersection({:x => true, :y => true, :d => true}, {:x => true, :z => true, :a => true, :d => true})
p set_minus({:x => true, :y => true, :d => true}, {:x => true, :z => true, :a => true, :d => true})