require 'rails_helper'

RSpec.describe AdminPanel::PlatesController, type: :controller do
  let!(:plate) { create(:plate) }
  let(:valid_attributes) { attributes_for(:plate) }
  let(:invalid_attributes) { attributes_for(:plate, title: nil) }

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
      get :show, params: { id: plate.id }
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with invalid attributes' do
      it 'does not create a new plate' do
        expect {
          post :create, params: { plate: invalid_attributes }
        }.to_not change(Plate, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      it 'updates the plate' do
        put :update, params: { id: plate.id, plate: valid_attributes }
        plate.reload
        expect(plate.title).to eq(valid_attributes[:title])
      end
    end

    context 'with invalid attributes' do
      it 'does not update the plate' do
        put :update, params: { id: plate.id, plate: invalid_attributes }
        plate.reload
        expect(plate.title).to_not eq(invalid_attributes[:title])
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the plate' do
      expect {
        delete :destroy, params: { id: plate.id }
      }.to change(Plate, :count).by(-1)
    end
  end
end
