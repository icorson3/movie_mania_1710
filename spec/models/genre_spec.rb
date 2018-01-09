require "rails_helper"

describe Genre, type: :model do
  describe "relationships" do
    it {should have_many(:movies).through(:movie_genres)}
  end
end

describe "#average_rating" do
  it "can calculate average rating" do
    movie = create(:movie, rating: 5)
    movie2 = create(:movie, rating: 3)
    genre = create(:genre)
    MovieGenre.create(movie: movie, genre: genre)
    MovieGenre.create(movie: movie2, genre: genre)

    expect(genre.average_rating).to eq(4)
  end
end
