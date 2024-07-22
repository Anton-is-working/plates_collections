# frozen_string_literal: true

module Api
  module V1
    class CollectionsController < BaseController
      before_action :set_collection, only: %i[show update destroy]

      def index
        @collections = Collection.all
      end

      def show; end

      def create
        @collection = Collection.new(collection_params)
        if @collection.save
          render :show, status: :created, location: api_v1_collection_path(@collection)
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end

      def update
        if @collection.update(collection_params)
          render :show
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @collection.destroy
        head :no_content
      end

      private

      def set_collection
        @collection = Collection.find(params[:id])
      end

      def collection_params
        params.require(:collection).permit(:title, :description, :publish, images: [])
      end
    end
  end
end
