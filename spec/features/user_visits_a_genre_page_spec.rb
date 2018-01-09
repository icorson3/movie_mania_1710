require 'rails_helper'

describe "user visit the genre index" do
  describe "user selects one genre" do
    it "should see the genre show page with a list of associated movies" do
    user = create(:user)
    genre1 = Genre.create(name: "Action")
    genre2 = Genre.create(name: "Adventure")
    movie1 = create(:movie, title: "Suicide Squad", rating: 2)
    movie2 = create(:movie, title: "Guardians of the Galaxy", rating: 8)
    GenreMovie.create(movie_id: movie1.id, genre_id: genre1.id)
    GenreMovie.create(movie_id: movie2.id, genre_id: genre1.id)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit genres_path

    expect(page).to have_content("All Genres")

    click_link(genre1.name)

    expect(current_path).to eq(genre_path(genre1))
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)
    expect(page).to have_content(movie1.rating)
    expect(page).to have_content(movie2.rating)
    expect(page).to have_content("Average rating for this genre: 5")
    end
  end
end


# As an unregistered user,
# When I visit the genre index,
# And I click on "Action",
# I see a page with the genre's name,
# I see the movie "Guardians of the Galaxy" and "Suicide Squad" listed
# I also see the average rating for movies in this category
