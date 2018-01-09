require "rails_helper"

describe "As an unregistered visitor" do
  context "when i visit the movie index" do
    before :each do
      @director = Director.create(name: "Billy Bob")

      @movie = Movie.create(title: "Guardians of the Galaxy", description: "Great Movie!", director: @director, rating: 10)


      @genre_1 = Genre.create(name: "Action")
      @genre_2 = Genre.create(name: "Adventure")
      @genre_3 = Genre.create(name: "Sci-Fi")

      @genre_movie_1 = GenreMovie.create(movie_id: @movie.id, genre_id: @genre_1.id)
      @genre_movie_2 = GenreMovie.create(movie_id: @movie.id, genre_id: @genre_2.id)
      @genre_movie_3 = GenreMovie.create(movie_id: @movie.id, genre_id: @genre_3.id)

    end
    it "displays a movie title that is a hyperlink that goes to the show page for that specific movie with a rating for that movie and several generes for taht movie under a specific heading" do
      visit movies_path

      expect(page).to have_content(@movie.title)

      click_link("#{@movie.title}")

      expect(current_path).to eq(movie_path(@movie.slug))

      expect(page).to have_content("#{@movie.title}")

      within("#genre-heading") do
        expect(page).to have_content("Genres for this Movie:")
      end
    
      expect(page).to have_content("#{@genre_1.name}")
      expect(page).to have_content("#{@genre_2.name}")
      expect(page).to have_content("#{@genre_3.name}")

      expect(page).to have_content("#{@movie.rating}")
    end
  end
end
