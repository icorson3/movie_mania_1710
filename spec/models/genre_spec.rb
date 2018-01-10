require 'rails_helper'

describe Genre, type: :model do
  describe "relationships" do
    it {should have_many(:movies).through(:movie_genres)}
  end

  describe "validations" do
    context "valid attributes" do
      it "is valid with name" do
        genre = Genre.create(name: "action")
        expect(genre).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid with name" do
        genre = Genre.create
        expect(genre).to be_invalid
      end
    end
  end

  describe "methods" do
    it "should calculate average movie rating" do
      genre = Genre.create(name: "action")
      movie = create(:movie, rating: 3)
      movie2 = create(:movie)
      movie3 = create(:movie, rating: 5)
      genre.movies << [movie, movie2, movie3]

      expect(genre.average_movie_rating).to eq(4)
    end
  end
end
