def stock_picker(array)
	profit = 0
	start = 0
	stop = 0
	for i in (0...array.length)
		for j in ((i+1)...array.length-(i+1))
			if (array[j]-array[i] > profit)
				profit = array[j]-array[i]
				start = i
				stop = j
			end
		end
	end
	return [start,stop]
end
