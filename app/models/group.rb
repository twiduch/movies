class Group < ApplicationRecord
  belongs_to :user
  has_many :group_movies, dependent: :destroy
  has_many :movies, through: :group_movies
end
