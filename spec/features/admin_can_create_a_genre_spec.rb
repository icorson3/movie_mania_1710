require 'rails_helper'

describe "admin visits genre index page" do
  context "as an admin" do
    it "allows admin to create a genre" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      fill_in 'genre[name]', with: "comedy"

      click_button "Create Genre"

      expect(Genre.count). to eq(1)
    end
    it "allows admin  see a genre it has created" do
      admin = User.create(username: "funbucket13",
                          password: "test",
                          role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_genres_path

      fill_in 'genre[name]', with: "comedy"

      click_button "Create Genre"
      expect(page).to have_content("Genre: comedy")
    end
    it " does not allow a normal user  see visit admin area " do
      user = User.create(username: "funbucket13",
                          password: "test",
                          role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit admin_genres_path

      expect(page).to have_content("The page you were looking for doesn't exist.")
      expect(page).to_not have_content("Genre: comedy")

    end
  end
end
