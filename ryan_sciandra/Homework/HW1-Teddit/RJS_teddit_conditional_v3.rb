# This assures that the first letter of each word the user enters is capitalized so that it matches what is entered in the calculate_upvotes(story, category) method.
def get_input 

	gets.split.map(&:capitalize).join(' ')

end

# This takes the users inputs and determines what response to return and what upvote calculation to use.
def calculate_upvotes(story, category)

	upvotes = 1

	if story.include?("Cat") && story.include?("Bacon") && story.include?("Food")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and HOLY CRAP it already has a whopping #{((upvotes * 5) * 8) * 3} upvotes! That\'s insane, I think you\'ve set a new record!!"

	elsif story.include?("Cat") && story.include?("Bacon")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 5) * 8} upvotes!"

	elsif story.include?("Cat") && story.include?("Food")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 5) * 3} upvotes!"

	elsif story.include?("Cat")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{upvotes * 5} upvotes!"		

	elsif story.include?("Bacon") && story.include?("Cat")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 8) * 5} upvotes!"

	elsif story.include?("Bacon") && story.include?("Food")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 8) * 3} upvotes!"

	elsif story.include?("Bacon")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{upvotes * 8} upvotes!"		

	elsif story.include?("Food") && story.include?("Cat")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 3) * 5} upvotes!"

	elsif story.include?("Food") && story.include?("Bacon")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{(upvotes * 3) * 8} upvotes!"

	elsif story.include?("Food")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and it already has a whopping #{upvotes * 3} upvotes!"		

	end

end

# This welcomes the user to Teddit!
puts "Welcome to Teddit! A text based news aggregator. Get today\'s news tomorrow!"

puts "Please enter a news story you would like to submit:"

story = get_input

# This will continue to ask the user to input the story title up to 2x More times if missing keywords "Cat", "Bacon", or "Food".
if !story.include?("Cat") || !story.include?("Bacon") || !story.include?("Food") 

	2.times  

		puts "Hmmm, there was a problem?! Let\'s try that again"

		puts "What is the title of your news story:"

		story = get_input

		break if story.include?("Cat") || story.include?("Bacon") || story.include?("Food")

else

	# After the above pseudo loop cycles through, it breaks out and provides user with hint. Then asks them to re-enter story title.
	puts "Here's a hint ..."

	puts "We prefer stories that have something to do with Cat's, Bacon, or at least contain the word Food."

	puts "Why don't you try entering your story title one more time:"

	story = get_input

end

# Loop until the user has finally enterd the 
until story.include?("Cat") || story.include?("Bacon") || story.include?("Food")

	puts "Your story title is still missing our favorit keywords! Try again ..."

	story = get_input

end

# Asks for a Category for the user input story.
puts "Okay, enter where you would like your story categorized:"

category = get_input

puts "Great! Thanks for submitting your story ..."

puts calculate_upvotes(story, category)

end