class GroupMovie < ApplicationRecord
  belongs_to :group
  belongs_to :movie

  validates :group_id, uniqueness: { scope: :movie_id }
end
