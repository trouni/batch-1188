require_relative "scraper"
require "yaml"

puts "Scraping top 5 movie URLs..."
urls = scrape_top_urls

movies = urls.map do |url|
  puts "Scraping #{url}"
  scrape_movie(url)
end

puts "Storing movies in YAML file..."
File.write("movies.yml", YAML.dump(movies))
