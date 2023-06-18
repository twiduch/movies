class Movie < ApplicationRecord
  has_many :group_movies, dependent: :destroy
  has_many :groups, through: :group_movies
end
