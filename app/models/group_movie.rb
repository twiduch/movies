class GroupMovie < ApplicationRecord
  belongs_to :group, counter_cache: :movies_count
  belongs_to :movie

  validates :group_id, uniqueness: { scope: :movie_id }
end
