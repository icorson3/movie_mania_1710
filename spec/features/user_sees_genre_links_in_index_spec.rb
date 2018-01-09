# As an unregistered user,
# When I visit the genre index,
# And I click on "Action",
# I see a page with the genre's name,
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see the average rating for movies in this category

require "rails_helper"

describe "user can see genre show page" do
  it "user_can_see_movie with genre links" do
    movie = create(:movie)
    genre = create(:genre)

    visit genres_path

    click_on "Sci-Fi"

    expect(page).to have_content(movie.genre.name)
    expect(page).to have_content(movie.title)
    expect(page).to have_content(movie.movie_average_rating)
  end
end
