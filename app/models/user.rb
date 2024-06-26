class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :photo
  has_many :reviews
  has_many :properties, dependent: :destroy
  has_many :bookmarks
  has_many :bookmarked_managers, through: :bookmarks, source: :manager
end
