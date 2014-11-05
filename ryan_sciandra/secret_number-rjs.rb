# Method that allows entry of show_message("__") to puts/print something.
def show_message(message)
	puts message
end

# Method to collect user input
def get_input
    gets.strip
end

# Welcome user to the game
show_message "Welcome, welcome, welcome!"
show_message "My name is Ryan and I created this here game!!"
show_message "What's your name?"

# Get the users input for their name and spits back a personal greeting.
username = get_input
show_message "Well hello there #{username}, glad to meet you!!"
show_message " "

# This will print out the rules to this here lil game of chance.
show_message "So here's the deal ... This is a guessing game. I, or really the computer, picks a number between 1 and 10 and you have to guess it."
show_message "The only thing is you only have three chances, and that\'s it!"
show_message "Got it? Wanna play?"
show_message "Put 'y' for YES, and 'n' for NO:"
play = get_input

# If the user enters 'y', that means they want to play and the program will ask them to choose a number.
while play == "y"
	# Did the user win at this point?
	win = false
	# Generate random number between 1 - 10
    rand_num = rand(10) + 1
    show_message "Okay, I\'v got a number, take a guess ..."
    # Define the variable that will keep count of how many times the user guesses the secret number. This needs to go before the loop starts so that it isn't continuously reset to 0.
	guess_count = 0
	while !win
		# Get the users number
		guessed_num = get_input.to_i
		# Incease the number of guess by one for each guess.
		guess_count += 1
		# This will cause the loop to break and inform the user of their loss
		if guess_count == 3
			show_message "Good try, but you loose ... Better luck next time!"
			break
		end
		# This loop needs to run twice before it quits, and beside telling the user too high or low, it needs to tell them they have one remaining attempt
		if guessed_num > rand_num
			show_message "Sorry, that\'s too high ..."
			show_message "You have #{(3 - guess_count)} guesses left ..."
		elsif guessed_num < rand_num
			show_message "Sorry, that\'s too low ..."
			show_message "You have #{(3 - guess_count)} guesses left ..."
		else
			win = true
			show_message "BAZING!! Get out of my head!!"
			show_message "You guessed right!!"
			show_message "Streamers and Confetti falling from the ceiling, while everyone is cheering!!"
		end
	end
	# Ask user if they want to play again
	show_message "Would you like to play again y/n?"
	play = get_input
end

if play == "n"
	show_message "Alright, see yah then!"
end