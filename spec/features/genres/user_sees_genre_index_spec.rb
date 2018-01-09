require 'rails_helper'

describe "a user visits the genre index page" do
  context "the user cant see a form to create a new genre" do
    it "the user sees a list with links to all genres" do

      genre = Genre.create!(name: "Comedy")
      genre2 = Genre.create!(name: "Romance")

      visit genres_path

      expect(page).to_not have_field("genre[name]")

      expect(page).to have_link("#{genre.name}")
      expect(page).to have_link("#{genre2.name}")

    end
  end

end
