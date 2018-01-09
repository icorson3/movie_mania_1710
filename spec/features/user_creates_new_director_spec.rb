

describe "user visits new director page" do
  context "they fill out a form with name" do
    it "creates a new director and redirects to director show" do
      visit "/directors/new"

      expect(page).to have_content("Create a New Director!")

      fill_in "director[name]", with: "Steven Spielberg"
      click_on "Create Director"

      latest_director = Director.last
      expect(current_path).to eq("/directors/#{latest_director.id}")
      expect(page).to have_content("#{latest_director.name}")
    end
  end

end
