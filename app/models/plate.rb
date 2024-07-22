class Plate < ApplicationRecord
  belongs_to :collection
  validates_presence_of :title

  has_one_attached :image

  def image_url
    Rails.application.routes.url_helpers.url_for(image.attachment) if image.attached?
  end
  
end
