json.array! @collections do |collection|
  json.id collection.id
  json.title collection.title
  json.description collection.description
  json.publish collection.publish
  json.created_at collection.created_at
  json.updated_at collection.updated_at
  json.images_urls collection.images_urls if collection.images.attached?
end
