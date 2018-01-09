# As an unregistered user,
# When I visit the genre index,
# I cannot see the form to create new genres, 
# I see all genres (for testing purposes, I should see at least 2) 
# and each genre should be a link to that genre's specific page
require "rails_helper"

describe "user sees genres with links" do
  context "unregistered user visits genre page" do 
    it "sees genre links" do
    genre_1 = Genre.create(name: "comedy")
    genre_2 = Genre.create(name: "action")

    visit genres_path

    save_and_open_page

    expect(page).to have_link(genre_1.name)
    expect(page).to have_link(genre_2.name)
    save_and_open_page
   end
  end
end