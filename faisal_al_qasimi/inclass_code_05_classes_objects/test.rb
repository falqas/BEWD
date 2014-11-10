# Use what we learned about JSON and REST APIs
# Get a list of petitions using the whitehouse petitions API
# 'http://api.whitehouse.gov/v1/petitions.json'
# In this case, there is documentation
# https://petitions.whitehouse.gov/developers#petitions-index
# Use the response to create an array (petitions) of hashes 
# that have keys of title, body, and signature count 
# 
# HINT: Use the gems we learned about last class, 'rest-client' and 'json'
require 'pry'
require 'rest-client'
require 'json'
petitions = []
url = 'http://api.whitehouse.gov/v1/petitions.json'
response = RestClient.get(url) 
parsed_response = JSON.parse(response)
parsed_response['results'].each do |petition|
binding.pry
	new_petition = {}
	new_petition[:title] = petition['title']
	new_petition[:body] = petition['body']
	new_petition[:signature_count] = petition['signatureCount']
	petitions << new_petition
binding.pry
end
