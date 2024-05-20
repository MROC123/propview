class Manager < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :reviews

  include PgSearch::Model
  pg_search_scope :search_by_name_and_address, against: [:name, :address]

  multisearchable against: [:name, :address]
end
