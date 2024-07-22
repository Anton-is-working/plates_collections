# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdminPanel::CollectionsController, type: :controller do
  let!(:collection) { create(:collection) }
  let(:valid_attributes) { attributes_for(:collection) }
  let(:invalid_attributes) { attributes_for(:collection, title: nil) }

  before do
    allow(controller).to receive(:authenticate_auth_user!).and_return(true)
  end

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #show' do
    it 'returns a successful response' do
      get :show, params: { id: collection.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new collection' do
        expect do
          post :create, params: { collection: valid_attributes }
        end.to change(Collection, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new collection' do
        expect do
          post :create, params: { collection: invalid_attributes }
        end.to_not change(Collection, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the collection' do
        put :update, params: { id: collection.id, collection: valid_attributes }
        collection.reload
        expect(collection.title).to eq(valid_attributes[:title])
      end
    end

    context 'with invalid attributes' do
      it 'does not update the collection' do
        put :update, params: { id: collection.id, collection: invalid_attributes }
        collection.reload
        expect(collection.title).to_not eq(invalid_attributes[:title])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the collection' do
      expect do
        delete :destroy, params: { id: collection.id }
      end.to change(Collection, :count).by(-1)
    end
  end
end
