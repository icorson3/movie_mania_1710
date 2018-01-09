# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).
require 'rails_helper'

describe "unregistered user visits movie index page" do
  context "they click on a movie" do
    it "sees movie page with genres for that movie and rating" do
      movie = create(:movie, rating: 5)
      genre = create(:genre)
      genre2 = create(:genre)
      MovieGenre.create(movie: movie, genre: genre)
      MovieGenre.create(movie: movie, genre: genre2)

      visit movie_path(id: movie.slug)

      expect(page).to have_content movie.title
      expect(page).to have_content "Genres for this Movie:"
      expect(page).to have_content genre.name
      expect(page).to have_content genre2.name

      expect(page).to have_content "Rating:"
      expect(page).to have_content movie.rating
    end

  end
end
