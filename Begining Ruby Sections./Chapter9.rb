require 'pstore'
class Person 
	attr_accessor :name, :job, :gender, :age
	def initialize(name, job, gender, age)
		@name = name
		@job = job
		@gender = gender
		@age = age
	end
end

Jerry = Person.new("Jerry James", "Software Developer", :male, 17)
Steffy = Person.new("Steffy James", "Doctor", :female, 19)
people = []
store = PStore.new("storagefile")
store.transaction do 
	store[:people] ||= Array.new
	#The ||= operator is used when you are not sure if it has already been assigned to an new Array Object. If it hasent then it assigns and creates it, if not then it skips it. 
	store[:people] << Jerry
	store[:people] << Steffy
	people = store[:people]
end

people.each do |person|
	puts person.inspect
end

