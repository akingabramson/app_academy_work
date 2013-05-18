def num_to_s(num, base)
  final = []
  hexa = {0 => "0", 1 => "1", 2 => "2", 3 =>"3", 4=> "4", 5=> "5", 6 => "6", 7 => "7", 8=>"8",
    9 => "9", 10 => "a", 11 => "b", 12 => "c", 13=> "d", 14 => "e", 15 => "f", 16 => "g"
   }
  exp = 0
  while base**exp <= num
    final << ((num / base**exp) % base)
    exp += 1
  end
  final.reverse!
  final.map! {|x| hexa[x] }
  return final.join
end

p num_to_s(153, 16)