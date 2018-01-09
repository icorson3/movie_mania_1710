class Category < ApplicationRecord

    has_many  :category_movies
    has_many  :movies, through: :category_movies

    def average_rating
      movies.average(:rating)
    end

end
