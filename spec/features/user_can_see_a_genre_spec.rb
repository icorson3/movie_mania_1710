describe "User visits genre index page" do
  describe "it clicks on link for specific genre" do
    it "sees genre name, movies, and average rating" do
      guardians = create(:guardians, rating: 5)
      suicide_squad = create(:movie, title: "Suicide Squad", rating: 0)
      action = create(:genre, name: "Action")
      action.movies << [guardians, suicide_squad]

      visit genres_path

      click_link "Action"

      expect(current_path).to eq("/genres/#{action.id}")
      expect(page).to have_link("Guardians of the Galaxy")
      expect(page).to have_link("Suicide Squad")
      expect(page).to have_content("Average Rating: 2.5")
    end
  end
end
