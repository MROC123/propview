class Review < ApplicationRecord
  belongs_to :property
  belongs_to :manager
  belongs_to :user
end
