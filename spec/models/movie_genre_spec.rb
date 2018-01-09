require 'rails_helper'

RSpec.describe MovieGenre, type: :model do
  it "has belong  to genre and movie " do 
    mg = MovieGenre.create(movie_id: 1, genre_id: 1)
    expect(mg).to respond_to(:movie)
    expect(mg).to respond_to(:genre)
  end
end
