require 'rails_helper'

describe "user visits genre index page" do
  context "as an admin" do
    context "fill out the form on page" do 
      it "allows admin to see all genres" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      expect(page).to have_content("Genres") 

      fill_in "genre[name]", with: "Comedy"
      save_and_open_page
      click_on "Create Genre"

      genre = Genre.last
      expect(current_path).to eq("/admin/genres") 
      expect(page).to have_content "Comedy"
      end
    end
  end
end