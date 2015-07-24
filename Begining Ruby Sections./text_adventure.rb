class Dungeon 
	attr_accessor :player
	def initialize(player_name)
		@player = Player.new(player_name)
		@rooms = []
	end

	def add_room(reference,name,description,connections)
		@rooms << Room.new(reference,name,description,connections)
	end

	def start(location)
		@player.location = location
		show_current_description
	end

	def show_current_description
		puts find_room_in_dungeon(@player.location).full_description
	end

	def find_room_in_dungeon(reference)
		@rooms.detect {|room| room == reference}
	end

	def find_room_in_direction(direction)
		find_room_in_dungeon(@player.location).connections[direction]
	end
	def go(direction)
		puts "You are going" + direction.to_s
		@player.location = find_room_in_direction(direction)
		show_current_description
	end

	class Player
		attr_accessor :name :location
		def initialize(name)
			@player = name
		end
	end
	class Room 
		attr_accessor :reference, :name, :description, :connections
		def initialize(reference,name,description,connections)
			@reference = reference
			@name = name
			@description = description
			@connections = connections
		end
		
		def full_description 
			@name + ", You are currently in " + @description
		end
	end


	Player = Struct.new(:name, :location)
	Room = Struct.new(:reference, :name, :description, :connections)
end

my_dungeon = Dungeon.new("Jerry")
my_dungeon.add_room(:largecave, "Large Cave", "a large and cavernous cave", {:west => :smallcave})

my_dungeon.add_room(:smallcave,"Small Cave", "A small and damp cave", {:east => :largecave})
direction = gets.chomp
my_dungeon.go(direction)
