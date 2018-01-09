require 'rails_helper'


describe "As an admin user" do
  context "when i visit the genre index" do
    before :each do
      @admin = User.create(username: "123", password: "123", role: 1)
      @genre_1 = create(:genre)
    end
    it "I can see a form that creates new genres, when I submit a new genre, the page reloads and displays a list of all the genres i have created" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)

      visit admin_genres_path

      fill_in"genre[name]", with: "SCARYMOVIE"
      click_on("Create New Genre")

      expect(current_path).to eq(admin_genres_path)

      expect(page).to have_content("Genre Index")
      save_and_open_page
      expect(page).to have_content("SCIFI")
      expect(page).to have_content("SCARYMOVIE")
    end
  end
end
