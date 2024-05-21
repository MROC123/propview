class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :manager
  validates :user_id, uniqueness: { scope: :manager_id, message: "already bookmarked" }

end
