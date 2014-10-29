# This assures that the first letter of each word the user enters is capitalized so that it matches what is entered in the calculate_upvotes(story, category) method.
def get_input 

	gets.split.map(&:capitalize).join(' ')

end

# This takes the users inputs and determines what response to return and what upvote calculation to use.
def calculate_upvotes(story, category)

	upvotes = 1

	if story.include?"Cat"

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has #{upvotes * 5} upvotes!"

	elsif story.include?"Bacon"

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has #{upvotes * 8} upvotes!"

	elsif story.include?"Food"

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has #{upvotes * 3} upvotes!"

	else

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, but it doesn\'t seem to be very popular. It only has #{upvotes} upvote!"
	end

end


# This welcomes the user to Teddit!
puts "Welcome to Teddit! A text based news aggregator. Get today\'s news tomorrow!"

# This collects and stores the stories title entered by the user.
puts "Please enter a news story you would like to submit:"

story = get_input

# This collects and stores the category entered by the user. 
puts "Okay, enter where you would like your story categorized:"

category = get_input

# This spits out a response based on the users input and the calculate_upvotes(story, category) method
puts "Great! Thanks for submitting your story ..."

puts calculate_upvotes(story, category)