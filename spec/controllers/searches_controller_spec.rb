require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe '#new' do
    it 'returns 200' do
      get :new
      expect(response).to have_http_status 200
    end
  end

  describe '#create' do
    let!(:count) { Search.count }

    context 'given valid params' do
      let(:params) { { search: { term: 'foo' } } }

      it 'redirects' do
        post :create, params: params
        expect(response).to have_http_status 302
      end

      it 'creates a search' do
        expect {
          post :create, params: params
        }.to change { Search.count }.by(1)
      end
    end

    context 'missing params' do
      let(:params) { { search: { term: '' } } }

      it 'returns 200' do
        post :create, params: params
        expect(response).to have_http_status 200
      end

      it 'renders new' do
        post :create, params: params
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    before { get 'show', params: {term: "elephants"} }

    let(:search) { Search.create(term: "elephants") }

    it 'returns status 200' do
      expect(response).to have_http_status 200
    end

    it 'renders show' do
      expect(response).to render_template :show
    end
  end

  describe '#index' do
    before { get :index }
    it 'returns 200' do
      expect(response).to have_http_status 200
    end

    it 'renders index' do
      expect(response).to render_template :index
    end
  end
end
