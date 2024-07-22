module AdminPanel
  class CollectionsController < ApplicationController
    before_action :authenticate_auth_user!
    before_action :set_collection, only: [:show, :edit, :update, :destroy]

    def index
      @collections = Collection.all
    end

    def show
    end

    def new
      @collection = Collection.new
    end

    def create
      @collection = Collection.new(collection_params)
      if @collection.save
        redirect_to admin_panel_collection_path(@collection), notice: 'Collection was successfully created.'
      else
        render :new, alert: 'Error creating collection.'
      end
    end

    def edit
    end

    def update
      if @collection.update(collection_params)
        redirect_to admin_panel_collection_path(@collection), notice: 'Collection was successfully updated.'
      else
        render :edit, alert: 'Error updating collection.'
      end
    end

    def destroy
      @collection.destroy
      redirect_to admin_panel_collections_path, notice: 'Collection was successfully destroyed.'
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
