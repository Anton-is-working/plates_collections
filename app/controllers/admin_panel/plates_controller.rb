# frozen_string_literal: true

module AdminPanel
  class PlatesController < ApplicationController
    before_action :authenticate_auth_user!
    before_action :set_plate, only: %i[show edit update destroy]

    def index
      @plates = Plate.all
    end

    def show; end

    def new
      @plate = Plate.new
    end

    def edit; end

    def create
      @plate = Plate.new(plate_params)
      if @plate.save
        redirect_to [:admin_panel, @plate], notice: 'Plate was successfully created.'
      else
        render :new
      end
    end

    def update
      if @plate.update(plate_params)
        redirect_to [:admin_panel, @plate], notice: 'Plate was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @plate.destroy
      redirect_to admin_panel_plates_url, notice: 'Plate was successfully destroyed.'
    end

    private

    def set_plate
      @plate = Plate.find(params[:id])
    end

    def plate_params
      params.require(:plate).permit(:title, :order, :collection_id, :image)
    end
  end
end
