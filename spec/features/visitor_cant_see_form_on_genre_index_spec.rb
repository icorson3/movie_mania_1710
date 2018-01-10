require "rails_helper"

describe "As a visitor that hasnt logged in" do
  context "when i visit the genre index" do
    before :each do
      @genre_1 = create(:genre)
      @genre_2 = Genre.create(name: "SCARYMOVIE")


    end
    it "only displays all genres, each genre is a clickable link to a genre show page and doesnt display a form to create new genre" do
      visit genres_path

      expect(page).to_not have_content("Create New Genre")

      expect(page).to have_content("SCIFI")
      click_link("SCIFI")
      expect(current_path).to eq(genre_path(@genre_1))
      expect(page).to have_content("SCIFI")

      visit genres_path

      click_link("SCARYMOVIE")
      expect(current_path).to eq(genre_path(@genre_2))
      expect(page).to have_content("SCARYMOVIE")
    end
  end
end
