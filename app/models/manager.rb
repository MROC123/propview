class Manager < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :reviews
  # has_many :reviews, through: :properties
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  multisearchable against: [:name, :address]

end
