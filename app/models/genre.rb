class Genre < ApplicationRecord
  has_many :movie_genres
  has_many :movies, through: :movie_genres
  validates_presence_of :name

  def average_movie_rating
    movies.average(:rating).to_i
  end
end
