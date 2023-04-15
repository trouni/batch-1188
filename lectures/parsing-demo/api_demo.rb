require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
puts "Type a GitHub username:"
username = gets.chomp

url = "https://api.github.com/users/#{username}"

response = URI.open(url) # The response has a lot of things including headers, etc.

body = response.read # Only take the body of the response

user = JSON.parse(body) # user is now a Hash

puts "#{user['name']} has #{user['public_repos']} public repos and is in #{user['location']}"
