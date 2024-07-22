# frozen_string_literal: true

class ApplicationService
  class << self
    def call(*args)
      new.call(*args)
    end
  end
end
