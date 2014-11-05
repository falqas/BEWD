# Teddit Contionals - Starter Code.

# Let's add a new Teddit feature. Upvotes!
# Complete the application below. 
# Where you see comments (lines that begin with #) replace it with code so that the program works.

def get_input(question)
	# ask question 
  	# check to make sure something has been entered:

  	answer = ""
  	puts answer.empty?
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

puts "Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!"
story = get_input("Please enter a News story:")
category = get_input("Please give it a category:")
#upvotes = calculate_upvotes(story, category)
#puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{upvotes}"
puts "New story added! #{story}, Category: #{category.capitalize}, Current Upvotes: #{calculate_upvotes(story, category)}"