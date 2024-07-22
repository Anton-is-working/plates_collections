# frozen_string_literal: true

module Collections
  class Index < ApplicationService
    def call(cache_key)
      Rails.cache.fetch(cache_key, expires_in: 1.hour) do
        Collection.where(publish: true)
      end
    end
  end
end
