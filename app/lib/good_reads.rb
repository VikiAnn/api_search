class GoodReads
  include HTTParty
  base_uri "https://www.goodreads.com"

  def self.search(term)
    response = get("/search/index.xml?key=#{ENV['GOOD_READS_KEY']}&q=#{term}")
    results = response.parsed_response.dig("GoodreadsResponse", "search", "results", "work")
    results.map do |result|
      GoodReadsBook.new(result)
    end
  end
end
