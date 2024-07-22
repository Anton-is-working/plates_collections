# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Collection, type: :model do
  it { should have_many(:plates) }

  it { should validate_presence_of(:title) }
end
