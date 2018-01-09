require "rails_helper"

describe "As a visitor" do
  context "when i visit the genre index and click on a genre title hyperlink" do
    before :each do
      @director = Director.create(name: "Billy Bob")

      @movie = Movie.create(title: "Guardians of the Galaxy", description: "Great Movie!", director: @director, rating: 10)
      @movie_2 = Movie.create(title: "Suicide Squad", description: "Bad Movie!", director: @director, rating: 10)


      @genre_1 = Genre.create(name: "Action")

      @genre_movie_1 = GenreMovie.create(movie_id: @movie.id, genre_id: @genre_1.id)

      @genre_movie_3 = GenreMovie.create(movie_id: @movie_2.id, genre_id: @genre_1.id)

    end

    it "will display a genre show page with the genre name, movie titles, and average rating for movies in the category" do
      visit genres_path

      expect(page).to have_content("#{@genre_1.name}")

      click_link("#{@genre_1.name}")

      expect(current_path).to eq(genre_path(@genre_1))

      expect(page).to have_content("#{@movie.title}")
      expect(page).to have_content("#{@movie_2.title}")
      
      expect(page).to have_content("Average Rating for Movies: #{Movie.avg_rating}")
    end
  end
end
