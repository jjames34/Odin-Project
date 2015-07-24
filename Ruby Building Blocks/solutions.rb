 dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
def caesar_cypher(text, shift)
	word = ""
	text.each_char do |c|
		if c == "!" || c == " " || c == ","
		word += c
	
	c == c.capitalize ? word += modify(c,shift,97,122): word += modify(c,shit,65,90) 
	end
	return word
end

def modify(c, shift, a, b)
	if c.ord - shift < a
		return (b - (c.ord-shift-a)).chr
	else
		return (c.ord-shift).chr
	end
end











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

def substrings(word, array)
	a = word.split(" ")
	result = Hash.new 
	a.each do |word| 
		temp = array.seclect {|x| word.downcase.include? x.downcase!}
		temp.each do |substring| 
			substring = substring.to_sym
			 if result.has_key?(substring)
			 	result[substring] = result.fetch(substring) + 1

			 result[substring] = 1
			
		end
	end
	return result + "That's all"
end



