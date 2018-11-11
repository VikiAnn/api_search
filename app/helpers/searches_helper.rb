module SearchesHelper
  def searches_with_counts
    Search.group(:term).count
  end
end
