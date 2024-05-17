class Manager < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :reviews
  # has_many :reviews, through: :properties

  include PgSearch::Model
  pg_search_scope :search_by_name, against: :name, using: { tsearch: { prefix: true } }

end
