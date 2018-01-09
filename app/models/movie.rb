class Movie < ApplicationRecord
  before_save :generate_slug
  belongs_to :director

  has_many :movie_genres
  has_many :genres, through: :movie_genres

  private

    def generate_slug
      self.slug = title.parameterize
    end

end
