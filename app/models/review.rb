class Review < ApplicationRecord
  belongs_to :property, optional: true
  belongs_to :manager
  belongs_to :user

  validates :pros, presence: true
  validates :cons, presence: true
  validates :advice, presence: true
  validates :rating, presence: true
end
