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
    genre_3 = Genre.create(name: "adventure")
    genre_4 = Genre.create(name: "thriller")

    visit genres_path

    expect(page).to have_link(genre_1.name)
    expect(page).to have_link(genre_2.name)
    expect(page).to have_link(genre_3.name)
    expect(page).to have_link(genre_4.name)
   end
  end
end