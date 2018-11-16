class SearchHistory < ApplicationRecord
  def date
    latest_date.strftime('%B %e, %Y %l:%M %P')
  end
end
