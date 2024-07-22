class Collection < ApplicationRecord
  has_many :plates, dependent: :destroy
  validates_presence_of :title

  has_many_attached :images

  def images_urls
    images.map { |image| Rails.application.routes.url_helpers.url_for(image) }.compact
  end
  
end
