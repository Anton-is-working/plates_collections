# frozen_string_literal: true

module Api
  module V1
    class PlatesController < BaseController
      before_action :set_plate, only: %i[show update destroy]

      def index
        @plates = Plate.all
      end

      def show; end

      def create
        @plate = Plate.new(plate_params)
        if @plate.save
          render :show, status: :created, location: api_v1_plate_path(@plate)
        else
          render json: @plate.errors, status: :unprocessable_entity
        end
      end

      def update
        if @plate.update(plate_params)
          render :show
        else
          render json: @plate.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @plate.destroy
        head :no_content
      end

      private

      def set_plate
        @plate = Plate.find(params[:id])
      end

      def plate_params
        params.require(:plate).permit(:title, :order, :image, :collection_id)
      end
    end
  end
end
