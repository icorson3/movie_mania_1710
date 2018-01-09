class Movie < ApplicationRecord
  before_save :generate_slug
  has_many :genre_movies
  has_many :genres, through: :genre_movies
  belongs_to :director

  private

    def generate_slug
      self.slug = title.parameterize
    end

end
