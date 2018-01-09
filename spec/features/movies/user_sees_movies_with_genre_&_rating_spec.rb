require 'rails_helper'

describe "a user visits the movie index page" do
  context "the user can click on a movie name and is redirected to the show page" do
    context "the user can see movie genres and rating" do
      it "the user sees movie attributes" do

        genre = Genre.create!(name: "Action")
        genre2 = Genre.create!(name: "Adventure")
        genre3 = Genre.create!(name: "Sci-Fi")
        genre4 = Genre.create!(name: "Romance")
        director = create(:director)
        director2 = create(:director)
        movie = Movie.create!(title: "Guardians of the Galaxy", description: "Space Movie", director: director, rating: 4)
        movie2 = Movie.create!(title: "The Notebook", description: "Sad Ending (Spoilers)", director: director2, rating: 3)
        MovieGenre.create(genre: genre, movie: movie)
        MovieGenre.create(genre: genre2, movie: movie)
        MovieGenre.create(genre: genre3, movie: movie)
        MovieGenre.create(genre: genre4, movie: movie2)


        visit movies_path

        expect(page).to have_link("#{movie.title}")
        expect(page).to have_link("#{movie2.title}")

        click_link "#{movie.title}"

        expect(current_path).to eq(movie_path(movie))

        expect(page).to have_content("#{movie.title}")
        expect(page).to_not have_content("#{movie2.title}")
        expect(page).to have_content("#{movie.rating}")
        expect(page).to_not have_content("#{movie2.rating}")
        expect(page).to have_content("Genres for this Movie:")
        expect(page).to have_content("#{genre.name}")
        expect(page).to have_content("#{genre2.name}")
        expect(page).to have_content("#{genre3.name}")
        expect(page).to_not have_content("#{genre4.name}")

      end
    end
  end
end
