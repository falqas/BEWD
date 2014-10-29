# This assures that the first letter of each word the user enters is capitalized so that it matches what is entered in the calculate_upvotes(story, category) method.
def get_input 

	gets.split.map(&:capitalize).join(' ')

end

def standard_response

	puts 

# This takes the users inputs and determines what response to return and what upvote calculation to use.
def calculate_upvotes(story, category)

	upvotes = 1

	if story.include?("Cat") && story.include?("Bacon") && story.include?("Food")

		puts "It\'s been added and can be found under the title '#{story}', Category: #{category}, and HOLY CRAP it already has a whopping #{((upvotes * 5) * 8) * 3} upvotes!" 
		puts "That\'s insane, I think you\'ve set a new record!!"
	

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

# This will continue to ask the user to input the story title until they enter one with either Cat, or Bacon, or Food in it.
until story.include?("Cat") || story.include?("Bacon") || story.include?("Food")

	puts "Hmmm, there was a problem?! Let\'s try that again, maybe this time use one of our favorite keywords in your title:'Cat' or 'Bacon' or 'Food' ..."

	puts "What is the title of your news story:"

	story = get_input

end

puts "Okay, enter where you would like your story categorized:"

category = get_input

puts "Great! Thanks for submitting your story ..."

puts calculate_upvotes(story, category)