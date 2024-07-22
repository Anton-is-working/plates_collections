# frozen_string_literal: true

class Invoice < ApplicationRecord
  validates_presence_of :name, :surname, :email
end
