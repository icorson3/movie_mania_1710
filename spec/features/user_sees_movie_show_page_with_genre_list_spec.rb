require "rails_helper"

describe "movie show page" do
  it "user_can_see_movie with genre" do
    movie = create(:movie)
    genre = Genre.create(name: "Sci-Fi", )

    visit movie_path(movie)
# As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).

    expect(page).to have_content(movie.title)
    expect(page).to have_content()
  end
end
