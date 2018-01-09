require 'rails_helper'

describe "user visit the genre index page" do
  it "should see a list of all genres" do
    user = create(:user)
    genre1 = Genre.create(name: "Genre 1")
    genre2 = Genre.create(name: "Genre 2")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit genres_path

    expect(page).to have_content("All Genres")
    expect(page).to have_content(genre1.name)
    expect(page).to have_content(genre2.name)
    expect(page).to have_no_content("Create A New Genre:")
  end

  it "clicks on a genre name and sees the genre show page" do
    user = create(:user)
    genre1 = Genre.create(name: "Genre 1")
    genre2 = Genre.create(name: "Genre 2")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit genres_path

    click_link(genre1.name)

    expect(current_path).to eq(genre_path(genre1))
    expect(page).to have_content(genre1.name)
  end

end
