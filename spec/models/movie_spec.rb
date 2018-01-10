require 'rails_helper'

describe Movie, type: :model do
  describe "relationships" do
    it {should have_many(:genres).through(:movie_genres)}
    it {should belong_to(:director)}
  end

  describe "validations" do
    context "valid attributes" do
      it "is valid with all attributes" do
        director = Director.create(name: "Quentin Tarantino")
        movie = Movie.create(title: "Kill Bill", description: "Revenge", director: director, rating: 4)

        expect(movie).to be_valid
      end
    end

    context "invalid attributes" do
      it "is invalid without title" do
        director = Director.create(name: "Quentin Tarantino")
        movie = Movie.create(description: "Revenge", director: director, rating: 4)

        expect(movie).to be_invalid
      end

      it "is invalid without description" do
        director = Director.create(name: "Quentin Tarantino")
        movie = Movie.create(title: "Kill Bill", director: director, rating: 4)

        expect(movie).to be_invalid
      end

      it "is invalid without rating" do
        director = Director.create(name: "Quentin Tarantino")
        movie = Movie.create(title: "Kill Bill", description: "Revenge", director: director)

        expect(movie).to be_invalid
      end
    end
  end

end
