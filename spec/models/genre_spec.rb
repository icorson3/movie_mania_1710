require "rails_helper"

describe Genre do 
  context "associations" do 
    it {should have_many :movies}
    it {should have_many :movie_genres}
  end
  context "instance methods" do
    it "shold calculate the average rating of its movies" do

    genre = Genre.create(name: "Action")
    director = create(:director)
    movie_1 = Movie.create(title: "Guardians of the Galaxy", description: "great", director_id: director.id, rating: 1, slug: movie_1 )
    movie_2 = Movie.create(title: "Suicide Squad", description: "great", director_id: director.id, rating: 5, slug: movie_2 )
    movie_3 = Movie.create(title: "Django", description: "great", director_id: director.id, rating: 3, slug: movie_3 )
    movie_genre_1 = MovieGenre.create(movie_id: movie_1.id, genre_id: genre.id)
    movie_genre_2 = MovieGenre.create(movie_id: movie_2.id, genre_id: genre.id)

    expect(genre.average_movie_rating).to eq 3

    end
    it "shold calculate the average rating with other ratings" do

    genre = Genre.create(name: "Action")
    director = create(:director)
    movie_1 = Movie.create(title: "Guardians of the Galaxy", description: "great", director_id: director.id, rating: 1, slug: movie_1 )
    movie_2 = Movie.create(title: "Suicide Squad", description: "great", director_id: director.id, rating: 1, slug: movie_2 )
    movie_3 = Movie.create(title: "Django", description: "great", director_id: director.id, rating: 1, slug: movie_3 )
    movie_genre_1 = MovieGenre.create(movie_id: movie_1.id, genre_id: genre.id)
    movie_genre_2 = MovieGenre.create(movie_id: movie_2.id, genre_id: genre.id)

    expect(genre.average_movie_rating).to eq 1

    end
  end
end