class Movie < ApplicationRecord
  before_save :generate_slug

  belongs_to :director

  has_many :genre_movies
  has_many :genres, through: :genre_movies

  private

    def generate_slug
      self.slug = title.parameterize
    end

end
