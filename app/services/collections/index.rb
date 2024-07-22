module Collections
  class Index < ApplicationService
    def call(cache_key)
      collections = Rails.cache.fetch(cache_key, expires_in: 1.hour) do
        Collection.where(publish: true)
      end
      collections
    end
  end
end
