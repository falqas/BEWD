##########################
## secret number game - OOP for multiple games
##
## - store the game history of each round/ player into two JSON files to keep player and games log.
## - TODO: write human-readable json log (must serialize object attributes into string)
##
## by Jonatan Schumacher
## 11/03/2014
##########################

require 'date'
require 'pry'
require 'json'

class SecretNumberGame


	#############
	###properties
	#############
	attr_accessor :number_of_rounds, :id, :player, :secret_number, :guesses, :score


	#############
	######methods
	#############

	#initialize
	def initialize(current_player)
		@utils = GameUtilities.new()

		self.id = Time.now

		self.number_of_rounds = 3
		self.guesses = Array.new(self.number_of_rounds)
		self.player = current_player
		#self.score = 0
	end


	#play game
	def play()
		#generate secret number
		self.secret_number = generate_secret_number()

		arr_guesses = []

		num_remaining_trials = @number_of_rounds

		#get players input
		while num_remaining_trials > 0 do
			arr_guesses << @utils.get_input_number("You have #{num_remaining_trials} #{num_remaining_trials > 1? "guesses" : "guess"} left. Please input a number between 1 and 10:",1,10)

			puts "\n"
			#check against the secret number
			if (arr_guesses.last.to_i == secret_number)
				break

			elsif (arr_guesses.last.to_i < secret_number)
				puts "Number #{arr_guesses.last} is too low.\n"
				@utils.animate_message("Guess a higher number!".upcase,0.75) if num_remaining_trials > 1
			else
				puts "Number #{arr_guesses.last} is too high.\n"
				@utils.animate_message("Guess a lower number!".upcase,0.75) if num_remaining_trials > 1
			end

			num_remaining_trials -= 1
		end

		#store players guesses
		self.guesses = arr_guesses
	end

	#print the result
	def display_results()
		if (guesses.last.to_i == secret_number) then
			puts "Congratulations. You won this round, #{player.name}! It took you #{guesses.size} #{guesses.size > 1? "attempts" : "attempt"}."
		else
			puts "Bummer. You did not win this round, #{player.name}! \nThe secret number was #{secret_number}. Your guesses were: #{guesses.join(", ")}"
		end

		puts "Your current score is #{'%.2f' % score}, and your average score is % #{'%.2f' % player.avg_score}"
	end

	#store the results of teh last game in the user and games history
	def calculate_and_save_results()
		self.score = calculate_score(100)
		#binding.pry
		#@@all_games[id] = self
		player.games << self
		player.avg_score = player.calculate_avg_score()
		#binding.pry
	end

	#calculate score depending on players performance
	def calculate_score(max_score)
		multiplier = max_score.to_i
		guesses.last.to_i != secret_number ? 0 : multiplier * (number_of_rounds + 1 - guesses.size) / number_of_rounds.to_f
	end
	#generate a random number between 1 and 10
	def generate_secret_number()
		Random.new.rand(1..10) 
	end
	

	#this method does most of the work. Well. sorta
	def play_game_and_handle_results(current_player)
		play()
		calculate_and_save_results()
		display_results()
		#binding.pry
	end

end


## The Player class contains player attributes
class Player

	attr_accessor :name, :games, :avg_score, :member_since
	#store game history

	def initialize(name, cur_time)
		self.name = name
		self.games = []	#array of past games
		self.avg_score = 0
		self.member_since = cur_time.to_s
	end

	def calculate_avg_score()
		#use map function here: from http://stackoverflow.com/questions/11272929/how-to-sum-properties-of-the-objects-within-an-array-in-ruby
		(games.map(& :score).inject(0, &:+))/games.size.to_f
	end
end


## The GameUtilities class contains methods that are not specific to the game only
class GameUtilities
	#animate a message to the user
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
	def get_time_based_greeting(time)
		arr_times = ["Good Morning!", "Good Day!", "Good Afternoon!", "Good Evening!", "Hey there!"]

		if time.strftime("%H").to_i < 12 
			arr_times[0]
		elsif time.strftime("%H").to_i < 14
			arr_times[1]
		elsif time.strftime("%H").to_i < 18
			arr_times[2]
		elsif time.strftime("%H").to_i < 21
			arr_times[3]
		else
			arr_times[4]
		end
	end

	#get input string from user
	def get_input(question)
	  	# check to make sure something has been entered:
	  	answer = ""
		while answer.empty?
			puts question
			#get input and remove NewLine character
			answer = gets.delete("\n")
		end
		answer
	end

	# gets number from user within range
	def get_input_number(message, num_min, num_max)
		answer = -1
		while answer.to_i < num_min || answer.to_i > num_max
			answer = get_input(message)
		end
		answer
	end
end


## The GameMaster class is used to read and write the log file, and for initial user interaction
class GameMaster
	attr_accessor :current_time, :all_players, :all_games


	def initialize()
		self.all_players = Hash.new()
		self.all_games = Hash.new()
		@utils = GameUtilities.new()
		self.current_time = Time.now
		#intro
		puts("#{@utils.get_time_based_greeting(self.current_time)} It's time for a round of the secret number game.")
	end

	#get player handle and greet them - return the player
	def welcome_player()
		
		player = find_player_or_create_new(@utils.get_input("Please enter your name: ").capitalize!)

		#explain instructions if player has never played before. Else welcome them back
		if (player.games.empty?) then
			#it's a new player. Print instructions
			@utils.animate_message("\nWelcome to the Secret Number Game, #{player.name}!",1)
			puts("To win the game, you will have to guess the correct number between 1 and 10 in 3 attempts or less.")
		else
			@utils.animate_message("\nWelcome back to the Secret Number Game, #{player.name}! I will spare you the instructions",1.5)
		end
		player
	end

	#retreive player or create new
	def find_player_or_create_new(name)
		#check if player name exists in all_players hash
		#binding.pry
		if (self.all_players.has_key?(name)) then
			self.all_players.fetch(name)
		else
			new_player = Player.new(name, self.current_time)
			self.all_players[name] = new_player
			new_player
		end
	end

	#check if they want to play again
	def check_for_encore()
		@utils.get_input("Press 'y' if you want to play again, or any other key to quit").strip.downcase == 'y'
	end


	## TODO: must serialize my hash to human readable JSON http://stackoverflow.com/questions/4464050/ruby-objects-and-json-serialization-without-rails
	def write_log_to_json(hash, file_name)
		#binding.pry
		File.open(file_name,"w") do |f|
  			f.write(JSON[hash.to_json])
		end
	end

end


#############
######program
#############

#create a new GameMaster instance
my_game = GameMaster.new()

# TODO: read json log and populate @@all_players and @@all_games

the_player = my_game.welcome_player()

game_instance = SecretNumberGame.new(the_player)
game_instance.play_game_and_handle_results(the_player)

my_game.all_games[game_instance.id] = game_instance


while my_game.check_for_encore() do

	game_instance = SecretNumberGame.new(the_player)
	game_instance.play_game_and_handle_results(the_player)
	my_game.all_games[game_instance.id] = game_instance

end

# TODO: write human-readable json log (must serialize object attributes into string)
my_game.write_log_to_json(my_game.all_games,"secret_number_games_log.json")
my_game.write_log_to_json(my_game.all_players,"secret_number_players_log.json")

puts "Your Data has been saved. Good Bye"


