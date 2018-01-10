require 'rails_helper'

RSpec.describe Genre, type: :model do
  context "validations" do
    it "cant save without a name" do
      genre = Genre.new

      expect(genre).to be_invalid

    end

    it "can save with a name" do
      genre = Genre.new(name: "TYJSDLFKJSLFDJ")

      expect(genre).to be_valid
    end
  end

  context "instance methods" do
    it "gets you the average movie ratings across all movies " do
      @director = Director.create(name: "Billy Bob")

      @movie = Movie.create(title: "Guardians of the Galaxy", description: "Great Movie!", director: @director, rating: 10)
      @movie_2 = Movie.create(title: "Suicide Squad", description: "Bad Movie!", director: @director, rating: 10)


      @genre_1 = Genre.create(name: "Action")

      @genre_movie_1 = GenreMovie.create(movie_id: @movie.id, genre_id: @genre_1.id)
      @genre_movie_2 = GenreMovie.create(movie_id: @movie_2.id, genre_id: @genre_1.id)

      expect(@genre_1.avg_rating).to eq(10)
    end
  end
end
