def bubble_sort(array)
	isSorted = false
	until (isSorted)
		isSorted = true
		for i in (0...array.length-1)
			if (array[i+1] > array[i])
				array[i+1],array[i] = array[i],array[i+1]
				isSorted = false
			end
		end
	end
	return array
end

def bubble_sort_by(array)
	 isSorted = false
	 until (isSorted)
		isSorted = true
		for i in (0...array.length-1)
			if yield(array[i],array[i+1]) > 0
				array[i+1],array[i] = array[i],array[i+1]
				isSorted = false
			end
		end
	end
	return array
end
