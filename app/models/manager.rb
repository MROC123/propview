class Manager < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :reviews
  has_many :reviews, through: :properties

  include PgSearch::Model
  multisearchable against: [:name, :address]

end
