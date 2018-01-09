require 'rails_helper'

describe "admin visit the genre index page" do
  it "should see a form to create a new genre" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_genres_path

    expect(page).to have_content("Create A New Genre")
  end

  describe "admin fills out form to create new genre and submits" do
    xit "should see the genre index with newly created genre" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_genres_path

      fill_in "genre[name]", with: "NewGenre"
      click_button 'Submit'

      expect(current_path).to eq(genres_admin_path)
      within '.genre-list' do
        expect(page).to have_content("NewGenre")
      end
    end
  end
end





# As an admin user,
# When I visit the genre index,
# I can see a form to create new genres,
# When I fill out the form with the genre's name,
# And click submit,
# I see a list of genres I have created.
