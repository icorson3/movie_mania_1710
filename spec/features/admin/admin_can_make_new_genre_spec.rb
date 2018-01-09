require 'rails_helper'

describe "As an admin, when I visit the genre index" do
  describe "I can see a form to create new genres" do
    it "can fill out form with genre name and create the genre" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      fill_in "genre[name]", with: "Action"
      click_on "Submit"

      expect(current_path).to eq admin_genres_path
      expect(page).to have_content "Action"
    end
  end
end
