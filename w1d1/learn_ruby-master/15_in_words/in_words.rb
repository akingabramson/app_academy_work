class Fixnum

  WORDS = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
    }

  TEN_WORDS = {

   2 => "twenty",
   3 => "thirty",
   4 => "forty",
   5 => "fifty",
   6 => "sixty",
   7 => "seventy",
   8 => "eighty",
   9 => "ninety"

  }

  EXPONENTIALS = {
    12 => " trillion ",
    9 => " billion ",
    6 => ' million ',
    3 => ' thousand ',
    2 => ' hundred '
  }



  def in_words


    final = ""


    if self >= 10**2
      EXPONENTIALS.each do |key, value|
        if self >= 10**key
          final = in_trillions(self,key)
          break
        end
      end
    else
      final = in_tens(self)
    end
    final.strip

  end

  def in_trillions(input, exp)
    bils = input/10**exp
    final = ""
    final += bils.in_words + EXPONENTIALS[exp]
    if input%10**exp != 0
      final += (input%10**exp).in_words
    end
    final
  end

  def in_ones(input)
    return WORDS[input]
  end

  def in_tens(input)
    final = ""
    if input > 19
      tens = input/10
      final += TEN_WORDS[tens]+ " "
      final += in_ones(input%10) if input%10 != 0
    else
      final = in_ones(input)
    end
    return final
  end


end

p 9.in_words