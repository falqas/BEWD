# # We're going to add a remote data source to pull in stories from Mashable and Digg.
#   # http://mashable.com/stories.json
#   # http://digg.com/api/news/popular.json
# # These stories will also be upvoted based on our rules. No more user input!

require 'rest-client'
require 'pry'
require 'json'

# def show_message(message)
#   puts message
# end

# def get_input
#   gets.strip
# end

# def show_new_story_notification(story)
#   show_message("New story added! #{story[:title]}, Category: #{story[:category].capitalize}, Current Upvotes: #{story[:upvotes]}")
# end

# def calculate_upvotes(story)
#   story[:upvotes] = 1

#   if story[:title].downcase.include? 'cat'
#     story[:upvotes] *= 5
#   elsif story[:title].downcase.include? 'bacon'
#     story[:upvotes] *= 8
#   end

#   if story[:category].downcase == "food"
#     story[:upvotes] *= 3
#   end
# end

# def show_all_stories(stories)
#   stories.each do |story|
#     show_message "Story: #{story[:title]}, Category: #{story[:category]}, Current Upvotes: #{story[:upvotes]}"
#   end
# end

# stories = []

# show_message("Welcome to Teddit! a text based news aggregator. Get today's news tomorrow!")
# answer = "y"

# while answer == "y"
#   story = {}

#   show_message("Please enter a News story:")
#   story[:title] = get_input

#   show_message("Please give it a category:")
#   story[:category] = get_input

#   calculate_upvotes(story)

#   stories << story
#   show_new_story_notification(story)

#   show_message("Would you like to add another story? Enter 'y' or 'n'")
#   answer = get_input.strip.downcase
# end

# show_all_stories stories

def get_info_from_reddit
	url = "http://www.reddit.com/.json"
	response = RestClient.get(url)
	parsed_response = JSON.parse(response)
	stories = []
	parsed_story = parsed_response['data']['children'][0]['data']
	parsed_response['data']['children'].each do |story|
		new_story = {}
		new_story['title'] = story['data']['title']
		# Set category from reddit as a key
		new_story['category'] = story['data']['reddit']
		stories << new_story
	end
	binding.pry
end
get_info_from_reddit
