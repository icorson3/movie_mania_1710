require 'rails_helper'

RSpec.describe Genre, type: :model do
  it "has many movies" do 
    genre = Genre.create(name: "comedy")

    expect(genre).to respond_to(:movies)
  end
  it "can calculate the average rating fo movies" do 
    director = Director.create(name: "Steve")
    movie1 = director.movies.create(title: "Guardians of the  Galaxy", description: "people get lost", rating: 10)
    movie2 = director.movies.create(title: "Suicide Squad", description: "peopele fighting", rating: 2)
    genre1 = Genre.create(name: "Action")
    MovieGenre.create(movie_id: movie1.id, genre_id: genre1.id)
    MovieGenre.create(movie_id: movie2.id, genre_id: genre1.id)

    expect(genre1.average_rating). to eq(6)

  end
end
