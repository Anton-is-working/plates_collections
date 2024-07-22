require 'rails_helper'

RSpec.describe Api::V1::CollectionsController, type: :controller do
  let!(:collection) { create(:collection) }
  let(:valid_attributes) { attributes_for(:collection) }
  let(:invalid_attributes) { attributes_for(:collection, title: nil) }

  before do
    request.headers['Content-Type'] = 'application/json'
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: collection.id }, format: :json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new collection' do
        expect {
          post :create, params: { collection: valid_attributes }, format: :json
        }.to change(Collection, :count).by(1)
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new collection' do
        expect {
          post :create, params: { collection: invalid_attributes }, format: :json
        }.to_not change(Collection, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the collection' do
        put :update, params: { id: collection.id, collection: valid_attributes }, format: :json
        collection.reload
        expect(collection.title).to eq(valid_attributes[:title])
      end
    end

    context 'with invalid attributes' do
      it 'does not update the collection' do
        put :update, params: { id: collection.id, collection: invalid_attributes }, format: :json
        collection.reload
        expect(collection.title).to_not eq(invalid_attributes[:title])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the collection' do
      expect {
        delete :destroy, params: { id: collection.id }, format: :json
      }.to change(Collection, :count).by(-1)
      expect(response).to have_http_status(:no_content)
    end
  end
end
