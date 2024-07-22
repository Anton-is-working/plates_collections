json.extract! @collection, :id, :title, :description, :publish, :created_at, :updated_at
json.images_urls @collection.images.map { |image| url_for(image) } if @collection.images.attached?
