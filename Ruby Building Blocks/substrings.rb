def substrings(word, array)
	a = word.downcase.split(" ")
	result = Hash.new 
	a.each do |word|
		array.each do |value|
			if word.include? value
				result[value] == nil ? result[value] = 1 : result[value] = result[value] + 1
			end
		end
	end
	return result
end
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("below", dictionary)
puts substrings("Howdy partner, sit down! How's it going?", dictionary)