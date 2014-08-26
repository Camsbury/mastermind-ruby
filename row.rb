class Game
	# Object for displaying the rows that the user has previously input
	class Row

		attr_writer :num
		attr_writer :input
		attr_writer :solution

		def initialize(solution,num,input)
			@solution = solution
			@num = num
			@input = input
			respond
		end

		def respond

			@response = []

			compare_solution = @solution.dup
			compare_input = @input.dup

			4.times do |i|
				if compare_input[i] == compare_solution[i]
					@response << "black"
					compare_input[i] = "nomatchinput"
					compare_solution[i] = "nomatchcompare"
				end
			end

			4.times do |i|
				4.times do |j|
					if compare_input[i] == compare_solution[j]
						@response << "white"
						compare_input[i] = "nomatchinput"
						compare_solution[j] = "nomatchcompare"
					end
				end

			end

			@response.sort!
		end

		def display
			puts "\nAttempt #{@num}: #{@input.join(" ")} \nFeedback: #{@response.join(" ")}"
		end

	end
end