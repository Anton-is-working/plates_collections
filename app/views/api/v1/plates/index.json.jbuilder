json.array! @plates do |plate|
  json.id plate.id
  json.title plate.title
  json.order plate.order
  json.collection_id plate.collection_id
  json.image_url plate.image_url if plate.image.attached?
  json.created_at plate.created_at
  json.updated_at plate.updated_at
end