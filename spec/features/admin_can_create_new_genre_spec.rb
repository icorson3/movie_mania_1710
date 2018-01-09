describe "User visits genre index page" do
  context "as an Admin" do
    it "sees a form to create a new genre" do
      admin = create(:admin)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit genres_path

      expect(page).to have_content("Create New Genre")

      fill_in "genre[name]", with: "Sci-Fi"
      click_on "Create Genre"

      expect(current_path).to eq(genres_path)
      expect(page).to have_link("Sci-Fi")
    end
  end

  context "as a User" do
    it "does not see a form to create a new genre" do
      create(:genre, name: "Sci-Fi")
      create(:genre, name: "Action")

      visit genres_path

      expect(page).to_not have_content("Create New Genre")
      expect(page).to have_link("Sci-Fi")
      expect(page).to have_link("Action")
    end
  end
end
