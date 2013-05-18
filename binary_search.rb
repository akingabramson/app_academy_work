def merge_sort(array)
	if array.count <= 1
		return array
	else
		half = array.count/2
		left = array[0...half]
		right = array[half..-1]

		left_sort = merge_sort(left)
		right_sort = merge_sort(right)

		final = []

		until left_sort.empty? || right_sort.empty?
			if left_sort.first < right_sort.first
				final << left_sort.shift
			else
				final << right_sort.shift
			end
		end

		if left_sort.empty?
			final += right_sort
		else
			final += left_sort
		end

		final
	end
end










def binary_search(array, target)
	if array.count == 1
		if array[0] == target
			return 0
		else
			return nil
		end
	else
		indy = array.count/2

		if array[indy] == target
			return indy
		elsif array[indy] == nil
			return nil
		elsif array[indy] > target
			return binary_search(array[0...indy], target)
		else
			a = binary_search(array[indy..-1], target)
			if a == nil
				return nil
			else
				indy + a
			end
		end
	end
end

a = [4,2,3,1]

b = merge_sort(a)

p binary_search(b, 2)