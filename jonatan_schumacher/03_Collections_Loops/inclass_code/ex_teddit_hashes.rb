# Step 1: Working with Arrays and Hashes

# Copy your solution from conditional_teddit.rb. 
# Create an empty stories array. This will be used to hold all stories we capture.
# Users enter the story as they do now, but it gets put in a hash instead. 
# Update any reference to the story (upvotes, category and title) 
# Your story hash should look like the one below: 
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
# Using the stories array 
# Test your cat, bacon, and food upvote conditional logic.
#
# Step 2: Adding Loops 
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array. 
#
#

#methods
def get_input(question)
	# ask question 
  	# check to make sure something has been entered:

  	answer = ""
	while answer.empty?
		puts question
		#get input and remove NewLien character
		answer = gets.delete("\n")
	end
	return answer
end

def calculate_upvotes(story, category)
	upvotes = 0
	upvotes = story.length
	# Write code so that:
		# If the Story is about cats multiply the upvotes by 5
		upvotes = upvotes * 5 if story.downcase.include? "cats"
   		
		# If the Story is about bacon multiply the upvotes by 8
		upvotes = upvotes * 8 if story.downcase.include? "bacon"

		# If the Story is about Food it gets 3 times the upvotes.
		upvotes = upvotes * 3 if story.downcase.include? "food"

	upvotes
	#For example:
	# "Cats frolic despite tuna shortage" should give you 5 times the upvotes!
end

def calculate_grade(total_points)
	if total_points < 10 then
		return "your story straightout blows!"
	elsif total_points < 20 then
		return "yeah, right! "
	elsif total_points < 50 then
		return "nice story. I almost managed to stay awake"
	elsif total_points < 100 then
		return "Great Story Bro!"
	else 
		return "We discovered the new editor in chief for NY Times!"
	end		
end

def saveToFile(array_to_write)
	open('myfile.txt', 'a') { |f|
  f.puts "Hello, world."
}
end

# Create an empty stories array. This will be used to hold all stories we capture.
#variables
stories = Array.new
$keepAsking = true
$total_upvotes = 0

#the program
puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
while $keepAsking do
	story = get_input("Please enter a News story:")
	category = get_input("Please give it a category:")
	upvotes = calculate_upvotes(story, category)
	$total_upvotes +=upvotes
	# create new to hash 
	story_hash = { :story => story, :category=> category, :upvotes=> upvotes}

	# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
	stories<< story_hash
	puts story_hash.to_a.join(', ')
	
	if (get_input("Would you like to add another story? Enter 'y' or 'n'") == 'n') then 
		$keepAsking =  false 
	end
end

saveToFile(stories)
puts "#{calculate_grade($total_upvotes)} You achieved #{$total_upvotes} upvotes in total from #{stories.count} stories. Good Bye."
