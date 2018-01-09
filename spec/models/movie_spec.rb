require 'rails_helper'

describe Movies do
  context "instance methods" do
    it "#average_rating" do
      genre = Genre.create!(name: "Action")
      director = create(:director)
      director2 = create(:director)
      movie = Movie.create!(title: "Guardians of the Galaxy", description: "Space Movie", director: director, rating: 3)
      movie2 = Movie.create!(title: "Suicide Squad", description: "Bunch o' misfits", director: director2, rating: 1)

      expect(genre.movies.average_rating).to eq(2)
    end
  end
end
