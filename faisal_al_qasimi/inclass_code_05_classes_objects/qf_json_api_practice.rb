require 'rest-client'
require 'pry'
require 'json'

def get_petition_data
	url = "http://api.whitehouse.gov/v1/petitions.json"
	response = RestClient.get(url)
	parsed_response = JSON.parse(response)
end

		# parsed_response['title']['body']['sig_count']
get_petition_data

petitions = []
	parsed_response['results'].each do |story|
	new_petition = {}
	new_petition['title'] = story['results']['title']
	petitions << new_petition
binding.pry
end
# end
get_petition_data
binding.pry



# Use what we learned about JSON and REST APIs
# Get a list of petitions using the whitehouse petitions API
# 'http://api.whitehouse.gov/v1/petitions.json'
# In this case, there is documentation
# https://petitions.whitehouse.gov/developers#petitions-index
# Use the response to create an array (petitions) of hashes 
# that have keys of title, body, and signature count 
# 
# HINT: Use the gems we learned about last class, 'rest-client' and 'json'

# petitions = []

