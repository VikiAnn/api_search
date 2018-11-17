require 'rails_helper'

RSpec.describe GoodReads do
  let(:useful_response) { double :goodreads, parsed_response: parsed_response }
  let(:parsed_response) {
    { "GoodreadsResponse" =>
      { "search" =>
        { "results" =>
          { "work" => books } } } }
  }
  let(:books) {
    [book1, book2]
  }
  let(:book1) {
    { "best_book" =>
      { "title" => "Little Bunny Foo Foo",
        "author" => { "name" => "Michael Rosen" },
        "image_url" => "image_url" },
      "ratings_count" => 393,
      "average_rating" => 4.21
    }
  }
  let(:book2) {
    { "best_book" =>
      { "title" => "Leven Thumps and the Gateway to Foo",
        "author" => { "name" => "Obert Skye" },
        "image_url" => "image_url" },
      "ratings_count" => 18858,
      "average_rating" => 3.72
    }
  }
  let!(:result1) { GoodReadsBook.new(book1) }
  let!(:result2) { GoodReadsBook.new(book2) }
  before do
    allow(GoodReads).to receive(:get).and_return(useful_response)
    allow(GoodReadsBook).to receive(:new).with(book1).and_return(result1)
    allow(GoodReadsBook).to receive(:new).with(book2).and_return(result2)
  end

  describe ".search" do
    it "returns an array of GoodReadsBook objects" do
      expect(GoodReads.search("foo")).to contain_exactly(result1, result2)
    end
  end
end
