secret_number = rand(1..10)
guesses_allowed = 3
tries = 0

while tries < guesses_allowed
  tries += 1
  tries_left = guesses_allowed - tries

  puts 'Enter your guess:'
  guess = gets.strip.to_i

  if guess == secret_number
    puts 'You won!'
    exit
  else
    if guess < secret_number
      this_guess = 'low'
      next_guess = 'higher'
    elsif guess > secret_number
      this_guess = 'high'
      next_guess = 'lower'
    end
    puts "You guessed too #{this_guess}, try something #{next_guess}" if tries < guesses_allowed
  end

  if tries < guesses_allowed
    if tries_left > 1
      puts "You have #{tries_left} tries left"
    else
      puts "You have #{tries_left} try left"
    end
    puts
  end
end

puts "You failed to guess the secret number, it was #{secret_number}."