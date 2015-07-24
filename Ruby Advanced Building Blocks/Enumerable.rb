module Enumerable 
	def my_each
		return self if block_given?
		for i in self.length
			yield(i)
		end
	end

	def my_each_with_index
		return self if block_given?
		for i in (0...self.length)
			yield(self[i],i)
		end
	end

	def my_select
		return self.to_enum if !block_given
		result = []

		for i in self
			result.push(i) if yield(i)
		end
		return result
	end

	def my_all?
		isTrue = true
		for i in self
			if block_given?
				yield(i) ? isTrue : false
			else
				i ? isTrue :  false
			end
		end
	end

	def my_any?
		isAny = false
		for i in self
			if block_given?
				yield(i) ?  true : isAny=false
			else
				i ? true : isAny = false
			end
		end
		return isAny
	end

	def my_none?
		isNone = true
		for i in self
		if block_given?	
			yield(i) ? isNone = true : return true
		else 
			i ? isNone = true : return true
		end
		isNone
	end
	def my_count
		count = 0
		for i in self 
			if block_given?
				yield(i) ? count += 1 : count += 0
			else
				i ? count += 1 : count += 0
			end
		end
		 count
	end
	def my_map(code_block)
		



		end
	 def my_inject(initial=nil,sym=nil)

        result = initial.nil? ? nil : initial

        if block_given?
            for i in self
                result = yield(result,i)
            end
        else
            if sym.nil?
                sym = initial
                initial = nil
            end

            for i in self
                if initial.nil?
                    initial = i
                    result = initial
                else
                    result = result.send(sym,i)
                end
            end
        end

        return result

    end

    def my_map_two_args(proc=nil, &block)

        result = []

        for i in self
            result << block.call(proc.call(i)) if proc and block_given?
            result << proc.call(i) if !block_given?
            result << yield(i) if !proc and block_given?
        end

        return result
    end

end


# check the inject method:
def multiply_els(arr)
    # multiplies all the elements of the array together by using my_inject
    return arr.my_inject(:*)
end

puts multiply_els([2,4,5]) # => 40



