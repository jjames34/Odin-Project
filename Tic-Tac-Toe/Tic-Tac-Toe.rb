class Board 
	attr_accessor :board, :player1, :player2
	@@current_player = nil
	@@count = 0
	def initialize
		@board = [["-","-","-"], ["-","-","-"], ["-","-","-"]]
		@player1 = Player.new
		@player2 = Player.new
	end

	def display_board 
		@board.each do |r|
			puts r.each {|p| p}.join(" ")
		end
	end

	def start
		display_board
		puts "Welcome to Tic-Tac-Toe! Please, choose who you want to be (X or O)!"
		a = gets.chomp.upcase
		if a != "X" && a != "O"
			puts "That's not a valid choice."
			start
		end
		a == "X" ? @player1 = Player.new("X") : @player1 = Player.new("O")
		@player1.get_name == "X" ? @player2 = Player.new("O") : @player2 = Player.new("X")
		puts "Ok! Since the first player chose #{@player1.get_name}, that means the second player will be #{@player2.get_name}"
		choose_spot
	end

	def choose_spot
	until (playerWon("X") || playerWon("O") ||  tie?(@@count)) do
		@@current_player.nil? ? @@current_player = @player1 : @@current_player = @@current_player
		puts "Allright #{@@current_player.get_name}, choose the row that you want to be in."
		row = gets.chomp.to_i - 1
		puts "Now choose the column that you want to be in"
		column = gets.chomp.to_i - 1
		if (column > 2 || row > 2)
			puts "That's not a valid answer, please try again"
			choose_spot
		end
		if (@board[row][column] != "-")
			puts "That spot is already taken, cheater."
			choose_spot
		end
		@board[row][column] = @@current_player.get_name.to_s
		display_board
		@@current_player.get_name.to_s == @player1.get_name.to_s ? @@current_player = @player2 : @@current_player = @player1
		@@count += 1
	end
	end
	def playerWon(string)
    	check = string
		if @board[0][0] == check && @board[0][1] == check && @board[0][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[1][0] == check && @board[1][1] == check && @board[1][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[2][0] == check && @board[2][1] == check && @board[2][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[0][0] == check && @board[1][0] == check && @board[2][0] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[0][1] == check && @board[1][1] == check && @board[2][1] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[0][2] == check && @board[1][2] == check && @board[2][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[0][0] == check && @board[1][1] == check && @board[2][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		elsif @board[2][0] == check && @board[1][1] == check && @board[0][2] == check
			puts "Congrats #{check.to_s}, you won!"
			return true
		else
			return false
		end
	end
	
	def tie?(num=0)
		if (num == 9)
			puts "It's a tie!"
			return true
		else
			return false
		end
	end

	attr_accessor :player
	attr_reader :count

	class Player
		def initialize(value = "X", count=0)
			@player = value
			@count = count
		end

		def get_name 
			@player.to_s
		end
		def count
			@count += 1
		end
	end
end



my_board = Board.new
my_board.start
