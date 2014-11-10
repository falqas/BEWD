# This is Larry Cobrin's number guessing game
# Here are the steps: 
# 1. Welcome the player with user name
# 2. Computer will pick a random number
# 3. Counter will be set to 1
# 4. Player picks a number
# 5. Three possible results, too high, too low, correct
# 6. Increase counter by one
# 7. Report result and give another try or end

def gets_input
	gets.strip
end
#method to find out if number is in range
def in_range (n)
	if n <1 || n> 10 
		false
	else
		true
	end
end

puts "Welcome to the magic number game.  \nYou will have three tries to pick a number between 1 and 10.  I will give you a little guidance."
puts "And away we go!!!"
puts "Lets start with your name" 
name = gets_input
puts "#{name}, it's go time!"
magic_number = rand(10-1)
#puts magic_number
correct = false
continue = true
count = 1
while continue == true
		while correct == false
			until count == 4
			puts "For guess #{count} please pick an integer between 1 and 10:"
			guess = gets_input.to_i
			until (in_range(guess)) 
				puts"Come on #{name}, I said an integer between 1 and 10. #{guess} does not work.  Try again"
				guess = gets_input.to_i
			end
			if guess == magic_number
				correct == true
				puts "Right on #{name}!  You got in in only #{count} tries. Word!"
				puts "want to try again? (y/n)"
				again = gets_input.downcase
#				puts again
				if again == "n"
					continue = false
				else
					magic_number = rand (10-1)
					puts magic_number
					count =1 
				end
			else
				if guess < magic_number
					puts "Too low"
				else
					puts "Too high"
				end
				count +=1
#				puts count
			end
		end
	puts "Not great. #{name}.  Your three tries are up.  Want another shot at the title? (y/n)"
		again = gets_input.downcase
				if again == "n"
					continue = false
				else
					magic_number = rand (10-1)
#					puts magic_number
					count =1 
				end
			end
end