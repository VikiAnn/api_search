class Search < ApplicationRecord
  validates :term, presence: true

  def results
    @results ||= GoodReads.search(term)
  end
end
