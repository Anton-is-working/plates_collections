# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectionsController, type: :controller do
  describe 'GET #index' do
    let!(:collection) { create(:collection) }

    before do
      allow(Collections::Index).to receive(:call).and_return([collection])
    end

    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    let!(:collection) { create(:collection) }

    it 'returns a successful response' do
      get :show, params: { id: collection.id }
      expect(response).to have_http_status(:ok)
    end
  end
end
