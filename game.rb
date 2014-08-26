class Game

	def initialize

		set_variables

		if intro_loop == "y"
			game_loop_guesser
		else
			game_loop_setter
		end

	end

	def set_variables

		@victory = false
		@player_input = false
		@rows=[]
		@solution = []

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

		return player_select

	end

	def instruct

			puts "\n\nThe player has 12 turns to find the solution."
			puts "The solution is an arrangement of a possible six colored pegs into 4 holes."
			puts "The six colors are black, white, green, yellow, red, and blue."
			puts "Each guess you make will be responded to with up to four white or black pegs."
			puts "Each white peg represents a correct color being chosen, but placed in the wrong hole."
			puts "Each black peg represents a correct color in the correct hole"
			puts "\nWhen you are ready to play, say anything"
			gets

	end

	def player_select

		repeat_selector = true

		while repeat_selector

			repeat_selector = false
			puts "Would you like to be the guesser? (y/n)"
			guesser = gets.chomp

			if !(guesser =~ /[yn]/)
				puts "Sorry, you must input y or n..."
				repeat_selector = true
			end

		end

		return guesser

	end

	#GAME LOOP AS GUESSER
	def game_loop_guesser
		
		comp_choose

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

	def comp_choose
		colors=["black","white","blue","yellow","red","green"]
		4.times do
			r=rand(0..5)
			@solution << colors[r]
		end
	end

	#GAME LOOP AS SETTNER
	def game_loop_setter
		
		user_choose

		1.upto(13) do |i|

			# Player turn 1 loop
			if i == 1
				puts "\nThe computer will guess the solution!"
				puts "\nPress anything to continue."
				gets
				computer_input = comp_guess
				puts "\nComputer guesses: #{computer_input.join(" ")}"
				# adds attempt to rows
				@rows << Row.new(@solution,1,computer_input)
				# Checks if player won
				if computer_input == @solution
					puts "\nCOMPUTER WINS!"
					return
				end

			# Player general turn loop
			elsif i < 13
				@rows.each {|row| row.display}
				puts "\nThe computer has #{13 - i} tries left!"
				puts "\nThe computer will guess the solution!"
				puts "\nPress anything to continue."
				gets
				computer_input = comp_guess
				puts "\nComputer guesses: #{computer_input.join(" ")}"
				# adds attempt to rows
				@rows << Row.new(@solution,i,computer_input)
				# Checks if player won
				if computer_input == @solution
					puts "\nCOMPUTER WINS!"
					return
				end

			# End of player turns
			else
				@rows.each {|row| row.display}
				# Checks if player won
				if computer_input == @solution
					puts "\nYOU WIN!"
					return
				end
				puts "\nThe computer failed. The solution is: #{@solution.join(" ")}"
			end

		end

	end

	def user_choose

		repeat_choice = true

		while repeat_choice

			repeat_choice = false
			puts "Using white, black, green, blue, yellow, and red, enter a solution."
			puts "You must enter four these colors, repeating whenever you like, with spaces between."
			input = gets.chomp

			checker = input.split(" ").all? do|i|
				(i =~ /black/) || (i =~ /white/) || (i =~ /blue/) || (i =~ /red/) || (i =~ /green/) || (i =~ /yellow/)
			end

			if !(checker)
				puts "Sorry, your input was incorrect..."
				repeat_choice = true
			end

		end

		@solution = input.split(" ")
	end

	def comp_guess
		guess = []
		colors=["black","white","blue","yellow","red","green"]
		4.times do
			r=rand(0..5)
			guess << colors[r]
		end
		return guess
	end

end