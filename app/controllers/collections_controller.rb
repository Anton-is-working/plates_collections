class CollectionsController < ApplicationController
  before_action :set_collection, only: %i[show]

  def index
    generate_cache_key('collections')

    @collections = Collections::Index.call(@cache_key)
  end

  def show; end

  private

  def set_collection
    @collection = Collection.includes(:plates).find_by(id: params[:id])
    
  end

  def generate_cache_key(name)
    @cache_key = "#{name}_#{Collection.maximum(:updated_at)}"
  end
end
