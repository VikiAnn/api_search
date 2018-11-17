require 'rails_helper'

RSpec.describe GoodReadsBook do
  let(:book_data) {
    { "best_book" =>
      { "title" => "Little Bunny Foo Foo",
        "author" => { "name" => "Michael Rosen" },
        "image_url" => "image_url" },
      "ratings_count" => 393,
      "average_rating" => 4.21
    }
  }
  subject do
    GoodReadsBook.new(book_data)
  end

  it "has a title" do
    expect(subject.title).to eq "Little Bunny Foo Foo"
  end

  it "has an author" do
    expect(subject.author).to eq "Michael Rosen"
  end

  it "has ratings" do
    expect(subject.ratings).to eq 393
  end

  it "has an image_url" do
    expect(subject.image_url).to eq "image_url"
  end

  it "has an average rating" do
    expect(subject.average_rating).to eq 4.21
  end
end
