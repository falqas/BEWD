
###############################################################################
#
# We're ready to program! To practice our Ruby skills lets create a secret
# number game. In this game players have three tries to guess a secret number
# between 1 and 10.
#
# Here are some guidelines to building your game:
#
#   Intros
#   - Welcome the player to your game. Let them know who created the game.
#   - Ask for the player's name then personally greet them by printing to the
#     screen, "Hi player_name!"
#   - Any good game will communicate the rules. Let the player know they must
#     guess a number between 1 and 10 and that they only have 3 tries to do so.
#
#   Functionality:
#     - Manually specify the secret number in a variable. Choose a random 
#       number between 1 and 10.
#     - Ask the user for their guess.
#     - Verify if they were correct. If the player guesses correctly they win
#       the game, they should be congratulated and the game should end.
#     - If they guess incorrectly, give the player some direction. If they
#       guess too high let them know, if they guess too low, let them know.
#     - Don't forget to let your players know how many guesses they have left.
#       Your game should say something like:
#         "You have X guesses before the game is over enter a another number"
#     - If they don't guess correctly after 3 tries, display that the player
#       lost and that the game is over. Be nice and let them know what the
#       `secret_number` was.
#
###############################################################################

require 'date'
require 'pry'


#############
#####methods:
#############
def get_name_and_greet()
	puts "\nWelcome to the secret number game. \nThe game was created by Jonatan.\n\n"

	player_name = get_input("Please enter your name:").capitalize!

	animate_message("\nGood #{get_time()}, #{player_name}!", 1)
	animate_message("To win the game, you will have to guess the correct number between 1 and 10 in 3 attempts or less.", 3)
	puts "Ready?\n\n"
	player_name
end


#use this method to receive input
def get_input(question)
	# ask question 
  	# check to make sure something has been entered:
  	answer = ""
	while answer.empty?
		puts question
		#get input and remove NewLine character
		answer = gets.delete("\n")
	end
	answer
end

def animate_message(message, num_seconds)
	message = message + "     "
	increment = num_seconds.to_f/ message.length

	message.split("").each do |i|
		print i 
		sleep(increment)
	end
	print "\n\n"
end


# gets the current System.Time (%H) returns only the current hour
def get_time()
	arr_times = ["Morning", "Day", "Afternoon", "Evening", "Night"]
	#binding.pry
	if Time.now.strftime("%H").to_i < 12 
		arr_times[0]
	elsif Time.now.strftime("%H").to_i < 14
		arr_times[1]
	elsif Time.now.strftime("%H").to_i < 18
		arr_times[2]
	elsif Time.now.strftime("%H").to_i < 21
		arr_times[3]
	else
		arr_times[4]
	end
end


# gets a
def get_input_number(message, num_min, num_max)
	answer = -1
	while answer.to_i < num_min || answer.to_i > num_max
		answer = get_input(message)
	end
	answer
end


def play_the_game(secret_num, num_rounds)

	arr_guesses = []

	num_remaining_trials = num_rounds
	while num_remaining_trials > 0 do
		#get their number
		arr_guesses << get_input_number("You have #{num_remaining_trials} guesses left. Please input a number between 1 and 10:",1,10)
		puts "\n"
		#check against the secret number
		if (arr_guesses.last.to_i == secret_num)
			break

		elsif (arr_guesses.last.to_i < secret_num)
			puts "Number #{arr_guesses.last} is too low.\n"
			animate_message("Guess a higher number!".upcase,0.75)
		else
			puts "Number #{arr_guesses.last} is too high.\n"
			animate_message("Guess a lower number!".upcase,0.75)
		end

		num_remaining_trials -= 1
	end

	arr_guesses  #return the array

end

##############
##the program:
##############

#initialize variables
number_of_rounds = 3
#score_last_round = 0.00


#greet the user
username = get_name_and_greet()

#generate a random number between 1 and 10
the_secret_number = Random.new.rand(1..10) 

#play the game
result = play_the_game(the_secret_number, number_of_rounds)

#store the result into arr_hash

#print the result
if (result.last.to_i == the_secret_number) then
	#score_last_round = 100 / result.size.to_i
	puts "Congratulations. You won this round, #{username}! It took you #{result.size} attempts."
else
	puts "Bummer. You did not win this round, #{username}! \nThe secret number was #{the_secret_number}. Your guesses were: #{result.join(", ")}"
end


