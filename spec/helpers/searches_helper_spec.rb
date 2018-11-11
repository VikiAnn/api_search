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
end
