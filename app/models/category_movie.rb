class CategoryMovie < ApplicationRecord
  # validates_presence_of :name

  belongs_to :movie
  belongs_to :category

end
