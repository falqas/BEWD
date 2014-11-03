require 'pry'

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

# Question: when to use = vs ==? Can we loop if guess = 0 OR if user_guess = secret_number?

puts "Welcome to the secret number game! This was created by Faisal"
puts "Please enter your name:"
player_name = gets.chomp
puts "Hi, #{player_name}!"
puts "Here are the rules to the game:\nYou must guess a number between 1 and 10. \n"
puts "BUT YOU ONLY GET 3 TRIES!!!11"
secret_number = 7

user_guess = 0
guess = 3


until guess == 0 do
  puts "You have #{guess} guesses remaining before the game is over. Enter a number please:"
  user_guess = gets.to_i
  break if user_guess == secret_number
  if user_guess < secret_number
    puts "Too low!"
  else puts "Too high!"
  end
    guess -=1
end

if user_guess == secret_number 
  puts "Congratulations! You win!"
else
  puts "Out of tries! You lose! The correct answer was #{secret_number} you fool!"
end