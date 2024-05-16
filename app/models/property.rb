class Property < ApplicationRecord
  belongs_to :manager
  belongs_to :user

  has_many :reviews
  # has_many :bedrooms, dependent: :destroy

  include PgSearch::Model
  multisearchable against: [:name, :address]

  validates :name, presence: true
  validates :address, presence: true
  validates :property_type, presence: true
  validates :bedrooms, presence: true
  validates :bathrooms, presence: true
end
