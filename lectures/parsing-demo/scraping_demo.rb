require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com
ingredient = "chocolate"
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)

html_doc.search('h2.heading-4').each do |element|
  puts '----'
  p element.text
end

