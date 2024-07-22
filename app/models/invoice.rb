class Invoice < ApplicationRecord
  validates_presence_of :name, :surname, :email
  
end
