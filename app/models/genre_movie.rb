class GenreMovie < ApplicationRecord
  # validates_presence_of :name

  belongs_to :movie
  belongs_to :genre

end
