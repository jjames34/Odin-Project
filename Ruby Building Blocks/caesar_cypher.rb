def caesar_cipher(text, shift)
	word = ""
	text.each_char do |c|
		if c == "!" || c == " " || c == ","
		word += c
		else
		c == c.capitalize ? word += modify(c,shift,65,90): word += modify(c,shift,97,122) 
		end
	end
	return word
end

def modify(c, shift, a, b)
	if c.ord + shift > b
		return (shift-(b-(c.ord-1)) + a).chr
	else
		return (c.ord+shift).chr
	
	end
end
puts caesar_cipher("What a string!", 5)
