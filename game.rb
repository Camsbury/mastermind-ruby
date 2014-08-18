class Game

	def initialize

		@victory=false
		@player_input=false

		repeat_intro = true

		while repeat_intro
			repeat_intro = false
			puts "Welcome to Mastermind, would you like the rules? (y/n)"
			instructions = gets.chomp
			if !(instructions =~ /[yn]/)
				puts "Sorry, you must input y or n..."
				repeat_intro = true
			end
		end

		if instructions == "y"
			puts "\n\nYou have 12 turns to find the solution."
			puts "The solution is an arrangement of a possible six colored pegs into 4 holes."
			puts "Each guess you make will be responded to with up to four white or black pegs."
			puts "Each white peg represents a correct color being chosen, but placed in the wrong hole."
			puts "Each black peg represents a correct color in the correct hole"
			puts "\nWhen you are ready to play, say anything"
			gets
		end

		1.upto(13) do |i|
			if i < 13
				puts "You have #{13 - i} tries left!"
				puts "What do you think the solution is?"
				@player_input = gets.chomp
				if @player_input == "win"
					puts "YOU WIN!"
					return
				end
			else
				if @player_input == "win"
					puts "YOU WIN!"
					return
				end
				puts "Sorry, you fail."
			end
		end

	end

end