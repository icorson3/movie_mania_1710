class Movie < ApplicationRecord
  validates_presence_of :title
  before_save :generate_slug

  belongs_to :director
  has_many  :genre_movies
  has_many  :genres, through: :genre_movies
  has_many  :category_movies
  has_many  :categories, through: :category_movies

  private

  def generate_slug
    self.slug = title.parameterize
  end

end
