# app/models/bedroom.rb
class Bedroom < ApplicationRecord
  belongs_to :property

  validates :bedroom_type, presence: true
end
