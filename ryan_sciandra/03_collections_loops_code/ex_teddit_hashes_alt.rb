# Step 1: Working with Arrays and Hashes

# Copy your solution from conditional_teddit.rb
def get_input
  gets.strip
end

def calculate_upvotes(story, category)
  upvotes = 1
  if story.downcase.include? 'cat'
    upvotes *= 5
  elsif story.downcase.include? 'bacon'
    upvotes *= 8
  end
  if category.downcase == "food"
    upvotes *= 3
  end
  upvotes
end

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"

begin
	puts "Please enter a News story:"
	story = get_input
	puts "Please give it a category:"
	category = get_input
	stories = [] << {title: story, location: category, votes: calculate_upvotes(story, category)}
	upvotes = calculate_upvotes(story, category)
	puts "Would you like to add more stories?"
	puts "Enter 'y' for yes and 'n' for no ..."
	stay_go = get_input
end until stay_go == "n"

puts "New story added! #{stories[:title]} , Category: #{stories[:location]}, Current Upvotes: #{stories[:votes]}!"

# puts "New story added! " stories[:title].each{|story| puts story} ",Category: " stories[:location].each{|category| puts category} ", Current Upvotes: " stories[:votes].each{|calculate_upvotes(story, category)| puts calculate_upvotes(story, category)} "!"

# Create an empty stories array. This will be used to hold all stories we capture.
# Users enter the story as they do now, but it gets put in a hash instead. 
# Update any reference to the story (upvotes, category and title) 
# Your story hash should look like the one below: 
# { title: "Monkeys thank mayor for flounder tooth necklace", category: "Teeth", upvotes: 1 }
# Add the hash to an array called stories and print "Story: Monkeys thank mayor for flounder tooth necklace, Category: (Teeth), Current Upvotes: 1"
# Using the stories array 
# Test your cat, bacon, and food upvote conditional logic.

# Step 2: Adding Loops 
# Use a loop, so that your program continues to ask a user for stories until they chose to quit. ("Would you like to add another story? Enter 'y' or 'n'")
# Once the user is finished with entering their stories, use .each to print each story in the stories array. 
#
#
