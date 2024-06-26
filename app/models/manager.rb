class Manager < ApplicationRecord
  has_one_attached :photo
  belongs_to :user
  has_many :properties
  has_many :reviews
  # has_many :reviews, through: :properties

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookmarks
  has_many :bookmarked_by_users, through: :bookmarks, source: :user


  include PgSearch::Model
  multisearchable against: [:name, :address]

end
