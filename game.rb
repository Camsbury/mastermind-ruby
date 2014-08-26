class Game

	def initialize

		set_variables

		intro_loop

		game_loop

	end

	def set_variables

		@victory = false
		@player_input = false
		@rows=[]
		@solution = []
		comp_choose

	end

	def comp_choose
		colors=["black","white","blue","yellow","red","green"]
		4.times do
			r=rand(0..5)
			@solution << colors[r]
		end
	end

	def intro_loop

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

		# Prints instructions for the player
		if instructions == "y"
			instruct
		end

	end

	def instruct

			puts "\n\nYou have 12 turns to find the solution."
			puts "The solution is an arrangement of a possible six colored pegs into 4 holes."
			puts "The six colors are black, white, green, yellow, red, and blue."
			puts "Each guess you make will be responded to with up to four white or black pegs."
			puts "Each white peg represents a correct color being chosen, but placed in the wrong hole."
			puts "Each black peg represents a correct color in the correct hole"
			puts "\nWhen you are ready to play, say anything"
			gets

	end

	#GAME LOOOP
	def game_loop

		1.upto(13) do |i|

			# Player turn 1 loop
			if i == 1
				puts "\nWhat do you think the solution is?"
				puts "(Put your answer as the four colors in order with spaces to separate them)"
				@player_input = gets.chomp.split(" ")
				# adds attempt to rows
				@rows << Row.new(@solution,1,@player_input)
				# Checks if player won
				if @player_input == @solution
					puts "\nYOU WIN!"
					return
				end

			# Player general turn loop
			elsif i < 13
				@rows.each {|row| row.display}
				puts "\nYou have #{13 - i} tries left!"
				puts "\nWhat do you think the solution is?"
				@player_input = gets.chomp.split(" ")
				# adds attempt to rows
				@rows << Row.new(@solution,i,@player_input)
				# Checks if player won
				if @player_input == @solution
					puts "\nYOU WIN!"
					return
				end

			# End of player turns
			else
				@rows.each {|row| row.display}
				# Checks if player won
				if @player_input == @solution
					puts "\nYOU WIN!"
					return
				end
				puts "\nSorry, you fail. The solution is: #{@solution.join(" ")}"
			end

		end

	end

end