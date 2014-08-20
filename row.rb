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
			compare = @solution.dup
			4.times do |i|
				4.times do |j|
					if @input[i] == compare[j]
						if i == j
							@response << "black"
						else
							@response << "white"
						end
						compare[j] = ""
					end
				end
			end
			@response.sort
		end

		def display
			puts "\nAttempt #{@num}: #{@input.join(" ")} \nFeedback: #{@response.join(" ")}"
		end

	end
end