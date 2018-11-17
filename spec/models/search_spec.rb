require 'rails_helper'

RSpec.describe Search, type: :model do
  it { is_expected.to validate_presence_of(:term) }

  describe "#results" do
    let(:search) { Search.create(term: "foo") }
    context "called for the first time" do
      it "calls .search on GoodReads" do
        expect(GoodReads).to receive(:search).with(search.term)
        search.results
      end
    end

    context "called again" do
      before do
        allow(GoodReads).to receive(:search).and_return({status: 200, body: "", headers: {}})
      end

      it "does not call .search a second time on GoodReads" do
        search.results
        expect(GoodReads).not_to receive(:search)
        search.results
      end
    end
  end
end
