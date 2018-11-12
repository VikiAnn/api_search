module SearchesHelper
  def searches_with_counts
    Search.group(:term).count
  end

  def previous_search_dates(term)
    Search.where(term: term).pluck(:created_at).map do |date|
      date.strftime('%B %e, %Y %l:%M %P')
    end
  end
end
