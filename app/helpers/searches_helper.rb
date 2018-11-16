module SearchesHelper
  def searches_with_counts
    Search.group(:term).count
  end

  def previous_search_dates(term)
    Search.where(term: term).pluck(:created_at).map do |date|
      date.strftime('%B %e, %Y %l:%M %P')
    end
  end

  def link_to_sort(field, title=nil)
    title ||= field.titleize
    direction = field == sort_field && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {field: field, direction: direction}
  end
end
