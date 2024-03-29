def sum_iter(nums)
  sum = 0
  nums.each { |num| sum += num }
  sum
end


def sum_rec(nums)
  return 0 if nums.empty?
  nums[0] + sum_rec(nums[1..-1])
end

def exp1(base, power)
  (power == 0) ? 1 : (base * exp1(base, power - 1))
end

def exp2(base, power)
  if power == 0
    1
  elsif power == 1
    base
  else
    exp2(base, (power / 2.0).floor) * exp2(base, (power / 2.0).ceil)
  end
end

class Array

  [[1,2],[2,3]]

  [[1,2],[2,3]]

  def deep_dup
    # Argh! Mario and Kriti beat me with a one line version?? Must
    # have used `inject`...
    new_array = []
    self.each do |el|
      if el.is_a?(Array)
        new_array << el.deep_dup
      else
        new_array << el
      end
    end

    new_array
  end

  # The renowned one-line inject version of deep_dup
  # Beware inject!
  def d_dup
    inject([]) { |dup, el| dup << (el.is_a?(Array) ? el.d_dup : el) }
  end
end

a #=> [1,[4,3]]

def fibs_iter(n)
  case n
  when 1
    [0]
  when 2
    [0, 1]
  else
    # can't resist a recursive call!
    fibs = fibs_iter(2)
    (n - 2).times do
      fibs << fibs[-2] + fibs[-1]
    end

    fibs
  end
end

def fibs_rec(n)
  case n
  when 1
    [0]
  when 2
    [0, 1]
  else
    fibs = fibs_rec(n - 1)
    fibs << fibs[-2] + fibs[-1]
  end
end

def bsearch(nums, target)
  # nil if not found; can't find anything in an empty array
  return nil if nums.count == 0

  probe_index = nums.length / 2
  case target <=> nums[probe_index]
  when -1
    # search in left
    bsearch(nums[0...probe_index], target)
  when 0
    probe_index # found it!
  when 1
    # search in the right; don't forget that the right subarray starts
    # at `probe_index + 1`, so we need to offset by that amount.
    subproblem_answer = bsearch(nums[(probe_index + 1)..-1], target)
    (subproblem_answer.nil?) ? nil : (probe_index + 1) + subproblem_answer
  end

  # note that the array size is always decreasing through each
  # recursive call, so we'll either find the item, or eventually end
  # up with an empty array.
end

13

def make_change(target, coins = [25, 10, 5, 1])
  return [] if target == 0

  best_change = nil
  coins.sort.reverse.each_with_index do |coin, index|
    # can't use this coin, it's too big
    next if coin > target

    remainder = target - coin #remainder 3,2,1,0,

    best_remainder = make_change(remainder, coins[index..-1]) #best = [10][1][1],[1]

    this_change = [coin] + best_remainder

    if (best_change.nil? || (this_change.count < best_change.count))
      best_change = this_change
    end
  end

  best_change
end

class Array
  def merge_sort
    return self if count < 2

    middle = count / 2

    left, right = self[0...middle], self[middle..-1]
    sorted_left, sorted_right = left.merge_sort, right.merge_sort

    merge(sorted_left, sorted_right)
  end

  def merge(left, right)
    merged_array = []
    until left.empty? || right.empty?
      merged_array << ((left.first < right.first) ? (left.shift) : (right.shift))
    end

    merged_array + left + right
  end
end