class Manager < ApplicationRecord
  belongs_to :user
  has_many :properties
  has_many :reviews
  # has_many :reviews, through: :properties
  has_many :bookmarks
  has_many :bookmarked_by_users, through: :bookmarks, source: :user


  include PgSearch::Model
  multisearchable against: [:name, :address]

end
