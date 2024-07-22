require 'rails_helper'

RSpec.describe Plate, type: :model do
  it { should belong_to(:collection) }

  it { should validate_presence_of(:title) }
end