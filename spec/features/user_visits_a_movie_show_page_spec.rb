require 'rails_helper'

describe "user visit a movie show page" do
  it "should see a list of all genres associated with that movie" do
    user = create(:user)
    genre1 = Genre.create(name: "Action")
    genre2 = Genre.create(name: "Adventure")
    genre3 = Genre.create(name: "Sci-Fi")
    movie = create(:movie, title: "Guardians of the Galaxy", rating: 9)
    GenreMovie.create(movie_id: movie.id, genre_id: genre1.id)
    GenreMovie.create(movie_id: movie.id, genre_id: genre2.id)
    GenreMovie.create(movie_id: movie.id, genre_id: genre3.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit movies_path

    click_link(movie.title)

    expect(current_path).to eq("/movies/#{movie.slug}")
    expect(page).to have_content(movie.title)
    expect(page).to have_content("Genres for this Movie:")
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_content(genre3.name)
    expect(page).to have_content(movie.rating)
  end
end




#     As an unregistered user,
# When I visit the movie index,
# And I click on "Guardians of the Galaxy"
# I see a page with "Guardians of the Galaxy",
# I also see "Action", "Adventure", "Sci-Fi" under a "Genres for this Movie:" heading
# I also see the rating for this movie (rating should be an attribute of a movie).
