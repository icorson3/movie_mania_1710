require 'rails_helper'

describe "a user visits the genre index page" do
  context "the user clicks on a genre name to view the genre show" do
    it "the user sees movies that fall under that genre and their average rating" do

      genre = Genre.create!(name: "Action")
      genre2 = Genre.create!(name: "Romance")
      director = create(:director)
      director2 = create(:director)
      director3 = create(:director)
      movie = Movie.create!(title: "Guardians of the Galaxy", description: "Space Movie", director: director, rating: 5)
      movie2 = Movie.create!(title: "Suicide Squad", description: "Bunch o' misfits", director: director2, rating: 3)
      movie3 = Movie.create!(title: "The Notebook", description: "Sad Ending (Spoilers)", director: director3, rating: 3)
      MovieGenre.create(genre: genre, movie: movie)
      MovieGenre.create(genre: genre, movie: movie2)
      MovieGenre.create(genre: genre2, movie: movie3)

      visit genres_path

      expect(page).to have_link("#{genre.name}")
      expect(page).to have_link("#{genre2.name}")

      click_link genre.name

      expect(current_path).to eq(genre_path(genre))

      expect(page).to have_content(genre.name)
      expect(page).to have_content(movie.title)
      expect(page).to have_content(movie2.title)
      expect(page).to_not have_content(movie3.title)
      expect(page).to have_content(genre.movies.average_rating)


    end
  end

end
