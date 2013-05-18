def stock_picker(arr)
  final = []
  highest_profit = 0
  arr.each_with_index do |buy_price, index|
    days_left = arr[index+1..arr.count]
    days_left.each_with_index do |end_price, index2|
      if highest_profit < (end_price - buy_price)
        highest_profit = end_price - buy_price
        final[0] = buy_price
        final[1] = end_price
      end
    end
  end

  first_buy_day = arr.find_index(final[0])
  first_sell_day = arr.find_index(final[1])

  if highest_profit == 0
    return[0,0]
  else
    return [first_buy_day, first_sell_day]
  end

end

p stock_picker([10,9,3])