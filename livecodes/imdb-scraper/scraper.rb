require "open-uri"
require "nokogiri"

def scrape_top_urls
  url = "https://www.imdb.com/chart/top"
  html_file = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_file)

  html_doc.search(".titleColumn a").first(5).map do |element|
    "https://www.imdb.com" + element.attributes["href"].value
  end
end

def scrape_movie(url)
  html_file = URI.open(
    url,
    "Accept-Language" => "en",
    "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0"
  ).read

  doc = Nokogiri::HTML.parse(html_file)

  cast = doc.search(".sc-bfec09a1-1").first(3).map do |element|
    element.text.strip
  end

  director = doc.search(".ipc-metadata-list-item__list-content-item").first.text.strip

  storyline = doc.search(".sc-5f699a2-0").text

  title = doc.search(".sc-afe43def-1").text.strip

  year = doc.search(".sc-385ac629-3 .ipc-inline-list__item a").first.text.strip.to_i

  rating = doc.search(".sc-bde20123-1.iZlgcd").first.text.strip.to_f

  {
    cast: cast,
    director: director,
    storyline: storyline,
    title: title,
    year: year,
    rating: rating
  }
end
