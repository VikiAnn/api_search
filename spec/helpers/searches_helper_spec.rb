require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SearchesHelper. For example:
#
# describe SearchesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SearchesHelper, type: :helper do
  describe '#searches_with_counts' do
    before do
      Search.create(term: "foo")
      Search.create(term: "foo")
      Search.create(term: "bar")
      Search.create(term: "bar")
      Search.create(term: "bar")
    end

    it 'returns search terms with counts' do
      expect(helper.searches_with_counts).to eq({ "foo" => 2, "bar" => 3 })
    end
  end

  describe '#previous_search_dates' do
    include ActiveSupport::Testing::TimeHelpers
    let!(:oldest) do
      # annoyingly, the subtle differences between {  } and do .. end block syntax mean {  } doesn't work here.
      travel -7.day do
        Search.create!(term: "foo")
      end
    end
    let!(:next_oldest) do
      travel -3.day do
        Search.create!(term: "foo")
      end
    end
    let!(:newest) do
      travel -1.day do
        Search.create!(term: "foo")
      end
    end

    let(:oldest_date) { 7.days.ago.strftime('%B %e, %Y %l:%M %P') }
    let(:next_oldest_date) { 3.days.ago.strftime('%B %e, %Y %l:%M %P') }
    let(:newest_date) { 1.days.ago.strftime('%B %e, %Y %l:%M %P') }

    it 'returns dates of all previous searches with given term' do
      expect(helper.previous_search_dates("foo")).to contain_exactly(oldest_date, next_oldest_date, newest_date)
    end
  end
end
