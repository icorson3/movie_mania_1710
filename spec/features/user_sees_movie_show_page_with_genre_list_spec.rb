require "rails_helper"

describe "movie show page" do
  it "user_can_see_movie with genre" do
    movie = create(:movie)
    genre = create(:genre)

    visit movie_path(movie.slug)
# I also see the rating for this movie (rating should be an attribute of a movie).

    expect(page).to have_content(movie.title)
    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content(movie.genre.name)
    expect(page).to have_content(movie.rating)
  end
end
