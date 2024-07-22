json.extract! @plate, :id, :title, :order, :collection_id, :created_at, :updated_at
json.image_url @plate.image_url if @plate.image.attached?