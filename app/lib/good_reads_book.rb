class GoodReadsBook
  attr_reader :title, :author, :image_url, :ratings, :average_rating

  def initialize(book_data)
    @title = book_data["best_book"]["title"]
    @author = book_data["best_book"]["author"]["name"]
    @image_url = book_data["best_book"]["image_url"]
    @ratings = book_data["ratings_count"]
    @average_rating = book_data["average_rating"]
  end
end
