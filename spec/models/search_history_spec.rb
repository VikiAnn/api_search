require 'rails_helper'

RSpec.describe SearchHistory do
  describe '#date' do
    include ActiveSupport::Testing::TimeHelpers
    let!(:older_search) do
      travel -2.day do
        Search.create(term: "foo")
      end
    end
    let!(:later_search) { Search.create(term: "foo") }
    let(:search_history) { SearchHistory.first }
    let(:formatted_date) { Time.current.strftime("%B %e, %Y %l:%M %P") }

    it 'returns formatted version of latest_date' do
      expect(search_history.date).to eq formatted_date
    end
  end
end
