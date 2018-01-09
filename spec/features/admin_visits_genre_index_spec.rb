require "rails_helper"

describe "when and admin visits a genre index" do
  it "shows a form to create a new genre" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit genres_path

    expect(page).to have_content("All Genres")

    expect(page).to have_content("Create a new genre")
    fill_in "genre[name]", with: "horror"
    click_on "Create Genre"

    expect(page).to have_content(Genre.last.name)
  end

  describe "an unregistered user cannot create a new genre" do
    it "does not let them see the form" do

      user = create(:user)
      genre = Genre.create(name: "horror")
      genre2 = Genre.create(name: "action")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      visit genres_path

      expect(page).to have_content("All Genres")
      expect(page).to have_no_content("Create a new genre")
      expect(page).to have_no_content(genre.name)
      expect(page).to have_no_content(genre2.name)
      click_on "#{genre.name}"

      expect(current_path).to eq(genre_path(genre))
    end

    it "should show a link to the genre show page with its associated movies" do
      user = create(:user)
      genre = Genre.create(name: "horror")
      genre2 = Genre.create(name: "action")
      movie1 = create(:movie, title: "Guardians of the Galaxy")
      movie2 = create(:movie, title: "Suicide Squad", rating: 2)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      mg = MovieGenre.create(movie: movie1, genre: genre2)
      mg = MovieGenre.create(movie: movie2, genre: genre2)

      visit genres_path
      click_on "action"

      expect(current_path).to eq(genre_path(genre2))
      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)

      expect(page).to have_content("Average Rating: 3")
    end
  end
end
