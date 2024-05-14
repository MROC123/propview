class Property < ApplicationRecord
  belongs_to :manager
  has_many :reviews
  include PgSearch::Model
  multisearchable against: [:name, :address]

end
