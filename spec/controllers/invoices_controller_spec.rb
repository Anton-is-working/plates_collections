# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InvoicesController, type: :controller do
  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:valid_attributes) { attributes_for(:invoice) }

      it 'creates a new invoice' do
        expect do
          post :create, params: { invoice: valid_attributes }
        end.to change(Invoice, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:invalid_attributes) { attributes_for(:invoice, name: nil) }

      it 'does not create a new invoice' do
        expect do
          post :create, params: { invoice: invalid_attributes }
        end.to_not change(Invoice, :count)
      end
    end
  end
end
