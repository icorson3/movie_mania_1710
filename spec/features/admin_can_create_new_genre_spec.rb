describe "User visits genre index page" do
  context "as an Admin" do
    it "sees a form to create a new genre" do
      visit genres_path

      expect(page).to have_content("Create New Genre")

      within "#genre-form" do
        fill_in "genre[name]", with: "Sci-Fi"
        click_on "Create Genre"
      end

      expect(current_path).to eq(genres_path)
      expect(page).to have_content("Sci-Fi")
    end
  end

  context "as a User" do
    it "does not see a form to create a new genre" do
      create(:genre, name: "Sci-Fi")
      create(:genra, name: "Action")

      visit genres_path

      expect(page).to_not have_content("Create New Genre")
      expect(page).to have_content("Sci-Fi")
      expect(page).to have_content("Action")
    end
  end
end
