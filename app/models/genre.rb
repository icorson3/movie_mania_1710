class Genre < ApplicationRecord
  has_many :genre_movies
  has_many :movies, through: :genre_movies
  validates_presence_of :name

  def average_movie_rating
    movies.average(:rating)
  end

end
