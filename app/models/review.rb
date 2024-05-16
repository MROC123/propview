class Review < ApplicationRecord
  belongs_to :property, optional: true
  belongs_to :manager
  belongs_to :user
end
