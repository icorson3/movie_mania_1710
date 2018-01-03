class Movie < ApplicationRecord
  before_save :generate_slug

  belongs_to :director

  private

    def generate_slug
      self.slug = title.parameterize
    end

end
