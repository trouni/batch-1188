require_relative "../scraper"

describe "#scrape_top_urls" do
  it "returns an array with the top 5 movie URLs" do
    movie_urls = [
      "https://www.imdb.com/title/tt0111161/",
      "https://www.imdb.com/title/tt0068646/",
      "https://www.imdb.com/title/tt0468569/",
      "https://www.imdb.com/title/tt0071562/",
      "https://www.imdb.com/title/tt0050083/"
    ]
    expect(scrape_top_urls).to eq(movie_urls)
  end
end

describe "#scrape_movie" do
  it "returns a Hash containing all the movie information" do
    movie_url = "https://www.imdb.com/title/tt0468569/"
    expect(scrape_movie(movie_url)).to eq({
      cast: ["Christian Bale", "Heath Ledger", "Aaron Eckhart"],
      director: "Christopher Nolan",
      storyline: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.",
      title: "The Dark Knight",
      year: 2008,
      rating: 9.0
    })
  end
end
